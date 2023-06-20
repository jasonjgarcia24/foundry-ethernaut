// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "./Ownable-05.sol";

contract AlienCodex is Ownable {
    bool public contact;
    bytes32[] public codex;

    modifier contacted() {
        assert(contact);
        _;
    }

    function makeContact() public {
        contact = true;
    }

    function record(bytes32 _content) public contacted {
        codex.push(_content);
    }

    function retract() public contacted {
        codex.length--;
    }

    function revise(uint i, bytes32 _content) public contacted {
        codex[i] = _content;
    }
}

// 0x00000000000000000000000090CfBFFb21423219A6BcDbE08f8dC108Ca7EEA75
