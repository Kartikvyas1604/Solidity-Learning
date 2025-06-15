// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.4;

contract Blocktrain {
    
    address public owner;
    uint256 public _valueInEther = 1 ether;

    struct locker{
        uint256 value;
        uint256 time_locked;
    }

    uint counter = 0;
    mapping(uint => locker) public Vault;

    modifier Owner(){
        require(msg.sender == owner,"you are not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    modifier minimum(){
        require(msg.value >= 1 ether, "Doesn't follow minium criteria");
        _;
    }

    function deposite(uint256 _time) 
    public
    payable 
    Owner
    minimum
    {
        require(_time >= block.timestamp,"Invalid time");
        counter +=1;
        Vault[counter].time_locked = _time;
        Vault[counter].value = msg.value;
    }

    function Withdraw(uint256 _value , uint _lockerNumber) 
    public
    payable 
    Owner
    {
        _valueInEther = _value * (10**18);
        require(block.timestamp >= Vault[_lockerNumber].time_locked,"Come after some time");
        require(_valueInEther <= Vault[_lockerNumber].value, "Not enough money"); 
        payable(owner).transfer(_valueInEther);
        Vault[_lockerNumber].value -= _valueInEther;  
    }
}