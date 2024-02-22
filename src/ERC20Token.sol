// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MockERC20} from "forge-std/mocks/MockERC20.sol";

contract ERC20Token is MockERC20 {
    constructor(string memory _name, string memory _symbol, uint8 _decimals) {
        initialize(_name, _symbol, _decimals);
        _mint(msg.sender, 1e12 * (10 ** uint256(_decimals)));
    }
}
