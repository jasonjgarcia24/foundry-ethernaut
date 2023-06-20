// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "lib/forge-std/src/Test.sol";
import "../../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

interface ILevel19 {
    function whatIsTheMeaningOfLife() external returns (uint256);
}

contract Scratch is Test {
    function testThing() public {
        uint256 _thing;

        unchecked {
            _thing -= 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6;
        }

        console.logBytes32(keccak256(abi.encode(uint256(1))));

        console.logBytes32(
            bytes32(
                uint256(uint160(0x90CfBFFb21423219A6BcDbE08f8dC108Ca7EEA75))
            )
        );
        console.logBytes32(bytes32(_thing));
        // 0x0000000000000000000000000000000000000000000000000000000000000001
        // 0x37610255ab3f0df385209ed77d20f6af0a56ae9c81fcf83234b398d0d674743a
    }
}
