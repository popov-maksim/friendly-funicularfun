// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface DexTwo {
    function token1() external returns (address);
    function token2() external returns (address);

    function swap(address, address, uint256) external;

    function getSwapAmount(address, address, uint256) external view returns (uint256);

    function approve(address, uint256) external;

    function balanceOf(address token, address account) external view returns (uint256);
}
