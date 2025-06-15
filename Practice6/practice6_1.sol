// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import {Blocktrain2} from  "./practice6_2.sol";

contract Blocktrain1{
    address second;
    function Setaddress(address _second)
    public
    {
        second = _second;
    }
    function calling()
    public
    returns (string memory)
    {
        Blocktrain2 b = new Blocktrain2();
        return b.blocktrain3();
    }
}

