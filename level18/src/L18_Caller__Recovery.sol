// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {SimpleToken} from "./L18__Recovery.sol";

contract L18_Caller__Recovery {
    // Address collected from sepoliascan.etherscan.io
    SimpleToken public token =
        SimpleToken(payable(0xCF62575aa4f9E954a6Eb6c0A6d7E534375025F30));

    function destroySimpleToken() public {
        token.destroy(payable(address(this)));
    }

    receive() external payable {}
}
