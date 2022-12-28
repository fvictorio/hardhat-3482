// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Foo {}

contract Create2Deployer {
    function deploy(
        uint256 amount,
        bytes32 salt,
        bytes memory bytecode
    ) public returns (address addr) {
        require(address(this).balance >= amount, "Create2: insufficient balance");
        require(bytecode.length != 0, "Create2: bytecode length is zero");
        /// @solidity memory-safe-assembly
        assembly {
            addr := create2(amount, add(bytecode, 0x20), mload(bytecode), salt)
        }
        require(addr != address(0), "Create2: Failed on deploy");
    }
}
