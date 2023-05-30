// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {MagicNum} from "../src/L19__MagicNum.sol";
import {L19_Caller__MagicNum} from "../src/L19_Caller__MagicNum.sol";

// To solve this level, you only need to provide the Ethernaut with a Solver,
// a contract that responds to whatIsTheMeaningOfLife() with the right number.

// Easy right? Well... there's a catch.

// The solver's code needs to be really tiny. Really reaaaaaallly tiny. Like
// freakin' really really itty-bitty tiny: 10 opcodes at most.

contract L19_Solution__MagicNum is Script {
    MagicNum public magicNum =
        MagicNum(0x914947ebE03dEa5967cB9867F6119183c80dc4c9);

    function run() public {
        // Not needed.
    }
}
