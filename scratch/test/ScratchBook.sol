// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "lib/forge-std/src/Test.sol";

interface ILevel19 {
    function whatIsTheMeaningOfLife() external returns (uint256);
}

contract ScratchBool is Test {
    ILevel19 meaningContract =
        ILevel19(0x9223232eb7f3396853C5e79f47EeB86e23739639);

    function testFunc() public {
        uint256 _result = meaningContract.whatIsTheMeaningOfLife();

        console.log(_result);
    }
}
