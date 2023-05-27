// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {SimpleToken} from "../src/L18__Recovery.sol";
import {L18_Caller__Recovery} from "../src/L18_Caller__Recovery.sol";

// A contract creator has built a very simple token factory contract. Anyone
// can create new tokens with ease. After deploying the first token contract,
// the creator sent 0.001 ether to obtain more tokens. They have since lost
// the contract address.

// This level will be completed if you can recover (or remove) the 0.001 ether
// from the lost contract address.

contract L18_Solution__Recovery is Script {
    L18_Caller__Recovery public token_caller =
        L18_Caller__Recovery(
            payable(0xa196bFA3F4A1442bCabaA0a75B6DcF9D3fa99AbC)
        );

    function run() public {
        uint256 _myPrivKey = vm.envUint("PRIV_KEY");

        vm.startBroadcast(_myPrivKey);

        token_caller.destroySimpleToken();

        vm.stopBroadcast();
    }
}
