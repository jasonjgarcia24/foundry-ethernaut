// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {Denial} from "../src/L21__Denial.sol";
import {L21_Caller__Denial} from "../src/L21_Caller__Denial.sol";

// This is a simple wallet that drips funds over time. You can withdraw the
// funds slowly by becoming a withdrawing partner.

// If you can deny the owner from withdrawing funds when they call withdraw()
// (whilst the contract still has funds, and the transaction is of 1M gas or
// less) you will win this level.

contract L21_Solution__Denial is Script {
    // Not needed.
}
