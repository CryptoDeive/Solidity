// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

// Bad
contract BadContract {
    uint32[] data;
    address owner;
    
    constructor(uint32[] memory _data) public {
        owner = msg.sender;
        data = _data; // heavy operation
    }
}

// Good
contract GoodContract {
    uint32[] data;
    address owner;
    bool initialized;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function init(uint32[] memory _data) public {
        require(owner == msg.sender);
        require(!initialized);
        data = _data;
        initialized = true;
    }
}
