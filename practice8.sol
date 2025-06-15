// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract Blocktrain{
    Asuperfancysmartcontract[] public arrayOfcontract;
    function publishing()
    public
    {
       Asuperfancysmartcontract a = new Asuperfancysmartcontract();
       a.Doessuperfancystuff(); 
       arrayOfcontract.push(a);
    } 
    function Checkingowner(uint256 _number)
    public
    view 
    returns(address)
    {
        return arrayOfcontract[_number].owner();
    }
}

contract Asuperfancysmartcontract{
    address public owner;
    constructor() {
        owner = msg.sender;
    }

    function Doessuperfancystuff()
    public{
        
    }
}