// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

import {UniswapV2Factory, UniswapV2Pair} from "../src/v2/UniswapV2Factory.sol";
import {UniswapV2Router02} from "../src/v2/UniswapV2Router02.sol";
import {IERC20} from "../src/v2/interfaces/IERC20.sol";

contract DexTest is Test {
    function setUp() public {}

    function test_pintHash() public view {
        console.logBytes32(keccak256(type(UniswapV2Pair).creationCode));
    }
}
