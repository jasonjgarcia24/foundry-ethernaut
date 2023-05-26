// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "lib/forge-std/src/Test.sol";

contract ScratchBool is Test {
    function testFunc() public pure returns (uint256) {
        return (0x0F << 60) | (0x0F << 28) | (0x0F << 12);
    }

    function testFunc2() public pure returns (bytes8) {
        return
            bytes8(
                bytes2(
                    uint16(uint160(0x87912B149553F4F20A6DC7C4e5f651c6Ce5006fA))
                )
            ) >> 48;
    }

    function testFunc3() public pure returns (uint16) {
        return uint16(uint160(0x87912B149553F4F20A6DC7C4e5f651c6Ce5006fA));
    }

    function testFunc4() public pure returns (bytes4) {
        return bytes4(uint32(uint64(0xf0000000000006fa)));
    }

    function testFunc5() public returns (uint256) {
        address(this).call{gas: 8191}(abi.encodeWithSignature("stuff()"));

        return gasleft() % 8191;
    }

    function stuff() public view {
        console.log(gasleft() % 8191);
    }
}
