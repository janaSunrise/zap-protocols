// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract SimpleOwnable {
    address private _owner;

    modifier onlyOwner() {
        require(_owner == msg.sender, "SimpleOwnable: Not owner");
        _;
    }

    constructor() {
        _owner = msg.sender;
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(
            newOwner != address(0),
            "SimpleOwnable: New owner cannot be zero address"
        );
        _owner = newOwner;
    }
}
