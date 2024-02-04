// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Reentrance {

  function donate(address) external payable;

  function balanceOf(address) external view returns (uint);

  function withdraw(uint _amount) external;

  receive() external payable;
}