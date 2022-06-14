// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract TransferRestrictable {
    bool private allowsTransfer = true;

    function setAllowsTransfer(bool _allowsTransfer) public virtual {
        allowsTransfer = _allowsTransfer;
    }

    function isTransferAllowed() public view returns (bool) {
        return allowsTransfer;
    }
}
