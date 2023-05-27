// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {NaughtCoin} from "../src/L16__NaughtCoin.sol";
import {L16_Caller__NaughtCoin} from "../src/L16_Caller__NaughtCoin.sol";

// NaughtCoin is an ERC20 token and you're already holding all of them.

// The catch is that you'll only be able to transfer them after a 10 year
// lockout period. Can you figure out how to get them out to another address
// so that you can transfer them freely? Complete this level by getting your
// token balance to 0.

contract L16_Solution__NaughtCoin is Script {
    NaughtCoin public naughtCoin =
        NaughtCoin(0x95F41803948DaA9657A8B8153c0f250fBa549FE4);

    function run() public {
        // Not needed.
    }
}
