// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.4;

contract Blocktrain{
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    uint256  public coins = 0;
    function add() public {
        require(coins<=3,"Too many coins");
        coins++;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }
    function substract() public onlyOwner{
        coins --;
    }
}