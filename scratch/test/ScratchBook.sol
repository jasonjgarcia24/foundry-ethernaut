// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {console, Test} from "lib/forge-std/src/Test.sol";

import {L22_Caller__Shop} from "level22/src/L22_Caller__Shop.sol";

contract Scratch is Test {
    L22_Caller__Shop shopCaller =
        L22_Caller__Shop(0x42da677673505C806c72a41E4dC8f371d77E4185);

    uint public price = 100;
    bool public isSold;

    function testBuy() public {
        Buyer _buyer = Buyer(address(shopCaller));

        (bool _success, bytes memory _data) = address(_buyer).call(
            abi.encodeWithSignature("price()")
        );

        console.log("success: %s", _success);
        console.logBytes(_data);

        // if (_buyer.price() >= price && !isSold) {
        //     isSold = true;
        //     price = _buyer.price();
        // }
    }
}

interface Buyer {
    function price() external view returns (uint);
}
