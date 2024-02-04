// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.0;

interface AlienCodex {
    function contact() external returns(bool);
    function codex() external returns(bytes32);
    function makeContact() external;
    function record(bytes32) external;
    function retract() external;
    function revise(uint256, bytes32) external;
    function owner() external returns(address);
    function isOwner() external returns(bool);
    function transferOwnership(address) external;
}