// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract AdminEnumerable {
    mapping(address => bool) private admins;

    modifier onlyAdmin() {
        require(isAdmin(msg.sender), "AdminEnumerable: Only admin");
        _;
    }

    constructor() {
        admins[msg.sender] = true;
    }

    function grantAdmin(address to) public virtual {
        require(
            _isAuthorizedForAdminControl(msg.sender),
            "AdminEnumerable: Not authorized for admin control"
        );

        admins[to] = true;
    }

    function revokeAdmin(address to) public virtual {
        require(
            _isAuthorizedForAdminControl(msg.sender),
            "AdminEnumerable: Not authorized for admin control"
        );

        admins[to] = false;
    }

    function renounceAdmin() public onlyAdmin {
        admins[msg.sender] = false;
    }

    function isAdmin(address addr) public view returns (bool) {
        return admins[addr];
    }

    function _isAuthorizedForAdminControl(address addr)
        internal
        view
        virtual
        returns (bool);
}
