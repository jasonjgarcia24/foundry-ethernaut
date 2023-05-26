// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "lib/forge-std/src/Test.sol";

contract ScratchBool is Test {
    function testFunc() public pure returns (bool) {
        address _myAddress = 0x90CfBFFb21423219A6BcDbE08f8dC108Ca7EEA75;

        uint64 _numberThing = uint64(
            bytes8(keccak256(abi.encodePacked(_myAddress)))
        );

        return
            (_numberThing ^ uint64(bytes8(type(uint64).max - _numberThing))) ==
            type(uint64).max;
    }

    function stuff() public view {
        console.log(gasleft() % 8191);
    }
}
