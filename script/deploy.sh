#!/bin/sh

source .env

# echo "Token is $BEG_Token"

# constructor(address _signer, address _token)
# forge create  BEGVault  --verifier etherscan --constructor-args $SIGNER_ADDRESS  $BEG_Token


# forge verify-contract $BEG_VAULT  BEGVault \
# --constructor-args $(cast abi-encode "constructor(address,address)"  $SIGNER_ADDRESS  $BEG_Token)


forge verify-contract $DEX_FACTORY  UniswapV2Factory \
--constructor-args $(cast abi-encode "constructor(address)" "0x0000000000000000000000000000000000000000")


echo "WETH: $WETH, DEX_FACTORY: $DEX_FACTORY, DEX_ROUTER: $DEX_ROUTER"

forge verify-contract $DEX_ROUTER  UniswapV2Router02 \
--constructor-args $(cast abi-encode "constructor(address _factory, address _WETH)"  $DEX_FACTORY  $WETH)

