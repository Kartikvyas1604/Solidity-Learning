// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Blocktrain{
    address public owner;
    uint public balance;

    modifier onlyOwner(){
        require(msg.sender == owner,"can't touch it!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable { 
        balance += msg.value;
    }

    function Withdraw(address to, uint256 value) 
    public
    onlyOwner
    {
        require(value <= balance,"Don't have enough funds!");
        payable(to).transfer(value);
        balance -= value; // Update balance after transfer
    }
    function withdrawERC20(IERC20 token, address to, uint256 value)
    public 
    onlyOwner{
        uint256 ERC20balance = token.balanceOf(address(this));
        require(value <= ERC20balance,"Don't have enough funds");
        token.transfer(to, value);
    }
}