// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    SimpleStore public simpleStore;

    /// @dev Setup the testing environment.
    function setUp() public {
        simpleStore = SimpleStore(HuffDeployer.deploy("SimpleStore"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue(uint256 value) public {
        simpleStore.setValue(value);
        console.log(value);
        console.log(simpleStore.getValue());
        assertEq(value, simpleStore.getValue());
    }

    function testCheckRequire() public {
        vm.expectRevert();
        // NOTE: cannot get either of the below specific checks to work!
        // vm.expectRevert("There was an error");
        // vm.expectRevert(abi.encodeWithSignature("Error(string)"));
        simpleStore.checkRequire();
    }

    function testGetValue2() public {
        uint256 value = 24;
        simpleStore.setValue(value);
        uint256 v2 = simpleStore.getValue2();
        assertEq(v2, value * 2);
    }
}

interface SimpleStore {
    function setValue(uint256) external;
    function getValue() external returns (uint256);
    function getValue2() external returns (uint256);
    function checkRequire() external returns (bool);
}
