// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface NaughtCoin {

  function timeLock() external returns(uint);
  function INITIAL_SUPPLY() external returns(uint256);
  function player() external returns(address);
  function transfer(address, uint256) external returns(bool); 
} 