// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract Blocktrain{

    uint256 public _valueInEther = 1 ether;

    struct Account{
        address owner;
        uint256 balance;
        uint256 accountcreatedtime;
        string name;
    }

    mapping(address => Account) public SBI;

    event balcanceadded(
        string name,
        address owner,
        uint256 balance,
        uint256 timestamp
    );
    event withdrawal(
        string name,
        address owner,
        uint256 balance,
        uint256 timestamp,
        uint256 value
    );
 
    modifier minimum(){
        require(msg.value >= 1 ether, "Doesn't follow minium criteria");
        _;
    }

    function accountcreated(string memory _name)
    public 
    payable
    minimum{
        SBI[msg.sender].name = _name;
        SBI[msg.sender].owner = msg.sender;
        SBI[msg.sender].balance = msg.value;
        SBI[msg.sender].accountcreatedtime = block.timestamp;
        emit balcanceadded(_name,msg.sender,msg.value,block.timestamp);
    }



    function Deposite() 
    public 
    payable
    minimum
    {
        SBI[msg.sender].balance += msg.value;
        emit balcanceadded(SBI[msg.sender].name,msg.sender,msg.value,block.timestamp);
    }
    function withdrawalm(uint256 _value)
    public 
    payable 
    {
            _valueInEther = _value * (10**18);
            require(_valueInEther <= SBI[msg.sender].balance,"insufficiant Balance");
            payable(msg.sender).transfer(_valueInEther);
            SBI[msg.sender].balance -= _valueInEther;
            emit withdrawal(SBI[msg.sender].name, msg.sender, SBI[msg.sender].balance, block.timestamp, _value);
    }

}