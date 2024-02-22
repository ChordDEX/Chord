// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

import {UniswapV2Factory} from "../src/v2/UniswapV2Factory.sol";
import {UniswapV2Router02} from "../src/v2/UniswapV2Router02.sol";
import {IERC20} from "../src/v2/interfaces/IERC20.sol";
import {ERC20Token} from "../src/ERC20Token.sol";

contract DexDeployScript is Script {
    address weth = 0x4200000000000000000000000000000000000023;
    address usdb = 0x4200000000000000000000000000000000000022;

    function setUp() public {
        vm.startBroadcast();
    }

    function run() public {
        vm.broadcast();
    }

    function deploy() public {
        UniswapV2Factory factory = new UniswapV2Factory(address(0x0));
        UniswapV2Router02 router = new UniswapV2Router02(address(factory), weth);

        console.log("Factory address: ", address(factory));
        console.log("Router address: ", address(router));
        console.log("Sender address: ", msg.sender);

        // newTokenPair(router, "SHIBA", "SHIBA", 18);
    }

    function newTokenPair(
        UniswapV2Router02 router,
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) public {
        ERC20Token token = new ERC20Token(_name, _symbol, _decimals);

        token.approve(address(router), 2 ** 256 - 1);

        router.addLiquidityETH{value: 0.01 * 1e18}(
            address(token), 88000000000 * 1e18, 0, 0, msg.sender, block.timestamp + 1000000000
        );
    }
}
