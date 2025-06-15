// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract Blocktrain {
    mapping(uint256 => string) public student;

    function add(uint256 _num) public{
        for (uint256 i = 0 ; i<_num; i++) 
        {
            student[i] = "Blocktrain";
        }
    }

    function addNames(string[] memory _name) public{
       uint256 i = 0;
        while (i < _name.length) 
        {
            student[i] = _name[i];
            i++;
        }
    }

    function letsBreak(uint256 _num) public {
        do{
            student[0] = "Blocktrain";
        }while(_num < 0);
    }
    uint256 public coins = 0;
    function something() public {
        for (int i = 0; i<10; i++) 
        {
            if(i == 4)
            {
                break;
            }
            coins++;
        }
    }
}