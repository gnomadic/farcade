// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC1155} from "solady/tokens/ERC1155.sol";

contract FarcadeTicket is ERC1155 {
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;

    // Optional base URI
    string private _baseURI = "";

    constructor() {
        _name = "Farcade Ticket";
        _symbol = "TCKT";
        _baseURI = "";
    }

    /**
     * @dev Return the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Return the symbol of the token.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev See {IERC1155MetadataURI-uri}.
     *
     * Return a compatible metadata URI, unique for each token.
     */
    function uri(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        string memory baseURI = _baseURI;

        // If token URI is set, concatenate base URI and tokenURI (via abi.encodePacked).
        return
            bytes(baseURI).length > 0
                ? string(abi.encodePacked(baseURI, tokenId))
                : "";
    }

    /**
     * @dev Sets `baseURI` as the `_baseURI` for all tokens
     */
    function _setBaseURI(string memory baseURI) internal virtual {
        _baseURI = baseURI;
    }
}
