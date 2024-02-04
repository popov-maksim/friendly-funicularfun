// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Recovery, SimpleToken} from "../src/Recovery.sol";

contract AttackTest is Test {
    Recovery public recovery;
}
