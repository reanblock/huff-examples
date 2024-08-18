// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "src/HorseStoreV1.sol";
import "foundry-huff/HuffDeployer.sol";

contract HorseeStoreTest is Test {
    HorseStore storeSoliditiy;
    HorseStore storeHuff;

    function setUp() public {
        storeSoliditiy = new HorseStore();
        storeHuff = HorseStore(HuffDeployer.deploy("HorseStore"));
    }

    function testHorseStoreDeploy() public {
        console.log(address(storeSoliditiy));
        console.log(address(storeHuff));
    }

    function testUpdateHorseNumber(uint256 num) public {
        storeSoliditiy.updateHorseNumber(num);
        assertEq(storeSoliditiy.readNumberOfHorses(), num);

        storeHuff.updateHorseNumber(num);
        assertEq(storeHuff.readNumberOfHorses(), num);
    }
}