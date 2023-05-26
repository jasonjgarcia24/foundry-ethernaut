// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {Privacy} from "../src/L13__Privacy.sol";

// The creator of this contract was careful enough to protect the sensitive areas
// of its storage.

// Unlock this contract to beat the level.

contract L13_Solution__Privacy is Script {
    Privacy public privacy =
        Privacy(0x37d163122D96202C0ea53e61522837Fe313f1E89);

    bool public privacyLocked = true;
    uint256 public privacyID =
        0x000000000000000000000000000000000000000000000000000000006470307c;
    uint8 public privacyFlattening =
        0x000000000000000000000000000000000000000000000000000000000000000a;
    uint8 public privacyDenomination =
        0x000000000000000000000000000000000000000000000000000000000000ff00 >> 8;
    uint16 public privacyAwkwardness =
        0x00000000000000000000000000000000000000000000000000000000307c0000 >>
            16;
    bytes32 public privacyData0 =
        0xc4490a1e10b5177eb81fdb035d398af79d12466030d20a21d83842103c0930f6;
    bytes32 public privacyData1 =
        0xaca1151c6e8cea8eda324cecdeb25f2b4cdc81dc0cf684fff03179d0a3d7cd3d;
    bytes32 public privacyData2 =
        0x77003a89844e40a5ca7e8915177e9dbb9123ae8928eb2772d7743f9b41218e93;

    bool isLocked;

    function run() public {
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        isLocked = privacy.locked();
        console.log("Is locked? %s", isLocked);

        vm.startBroadcast(_robberPrivKey);

        privacy.unlock(bytes16(privacyData2));

        vm.stopBroadcast();

        isLocked = privacy.locked();
        console.log("Is locked still? %s", isLocked);
    }
}
