// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface Motorbike {
    fallback () external payable;
}

interface Engine {
    function upgrader() external returns(address);
    function horsePower() external returns(uint256);
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
    function initialize() external;
}