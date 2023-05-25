// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {Vault} from "../src/L9__Vault.sol";

// Unlock the vault to pass the level!

contract L9_Solution__Vault is Script {
    Vault public vault = Vault(0x6006A7204F11603696D6d149Bb3BFF3A6B44a15B);
    bytes32 public password =
        0x412076657279207374726f6e67207365637265742070617373776f7264203a29;
    bool locked;

    function run() public {
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        locked = vault.locked();
        console.log(locked);

        vm.startBroadcast(_robberPrivKey);

        vault.unlock(password);

        vm.stopBroadcast();

        locked = vault.locked();
        console.log(locked);
    }
}
