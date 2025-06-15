// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

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