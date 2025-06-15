// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.4;

contract Blocktrain {
     
     function hello()
     public
     pure
     {
        require(10<5, "I am bad at math");
     }
     function world() 
     public
     pure
     {
        assert(10!=10);
     }
     function gm()
     public 
     pure 
     {
        if(10<5){
            revert();
        }
     }
      
}