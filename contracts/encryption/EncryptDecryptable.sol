// SPDX-License-Identifier: MIT
// solhint-disable no-inline-assembly
pragma solidity ^0.8.0;

abstract contract EncryptDecryptable {
    /// @dev Function to encrypt/decrypt data using a key.
    /// @dev This is symmetric, i.e. decrypting encrypted data using same key gives the original data.
    // Taken from https://ethereum.stackexchange.com/questions/69825/decrypt-message-on-chain.
    function process(bytes memory data, bytes memory key)
        public
        pure
        returns (bytes memory result)
    {
        // Store data length on stack for later use
        uint256 length = data.length;

        assembly {
            // Set result to free memory pointer
            result := mload(0x40)

            // Increase free memory pointer by lenght + 32
            mstore(0x40, add(add(result, length), 32))

            // Set result length
            mstore(result, length)
        }

        // Iterate over the data stepping by 32 bytes
        for (uint256 i = 0; i < length; i += 32) {
            // Generate hash of the key and offset
            bytes32 hash = keccak256(abi.encodePacked(key, i));

            bytes32 chunk;
            assembly {
                // Read 32-bytes data chunk
                chunk := mload(add(data, add(i, 32)))
            }

            // XOR the chunk with hash
            chunk ^= hash;
            assembly {
                // Write 32-byte encrypted chunk
                mstore(add(result, add(i, 32)), chunk)
            }
        }
    }
}
