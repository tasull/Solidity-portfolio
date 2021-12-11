// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.9.0;

import "./SimpleStorage.sol"; 

contract StorageFactory is SimpleStorage {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address 
        return simpleStorageArray[_simpleStorageIndex].retrieve(); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //return simpleStorageArray[_simpleStorageIndex].retrieve(); 
    }

    function sfGetAddr(uint256 _simpleStorageIndex) public view returns (SimpleStorage) {
        SimpleStorage s = simpleStorageArray[_simpleStorageIndex];
        address addr = address(s);
        return SimpleStorage(address(addr));  
    }

    function sfGetAddr2(uint256 _simpleStorageIndex) public view returns (address) {
        SimpleStorage s = simpleStorageArray[_simpleStorageIndex];
        return address(s);  
    }
}