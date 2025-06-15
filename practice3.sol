// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract Blocktrain{
    struct Student{
        string name;
        string emailid;
        uint256 contactnumber;
        uint256 rollnumber;
        uint256 timestamp;
    }

    mapping(uint256 => Student) public studentdatabase;

    uint256 rollnumber = 1;

    event studentadded(
        string name,
        uint256 rollnumber,
        uint256 timestamp
    );

    function Studentadd(
        string memory _name,
        uint256 _contactnumber, 
        string memory _emailid) 
        public{
            studentdatabase[rollnumber].name = _name;
            studentdatabase[rollnumber].emailid = _emailid;
            studentdatabase[rollnumber].contactnumber = _contactnumber;
            studentdatabase[rollnumber].timestamp = block.timestamp;
            studentdatabase[rollnumber].rollnumber = rollnumber;
            emit studentadded(_name, rollnumber,block.timestamp);
            rollnumber+=1;
    }

}