// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./TokenERC721.sol";
contract CardERC721 is TokenERC721{
    struct Card{
        string name;
        uint256 level;
    }

    Card[] public cards;
    address public owner;

    constructor () TokenERC721("Junk Card","JCD","https://u3flw3vcfmq9.usemoralis.com/"){
        owner = msg.sender;
    }

    function mintCard(string memory name, address account, string memory tokenUri ) public {
        require(owner == msg.sender,"Not owner of this card");
        uint256 cardId = cards.length;
        cards.push(Card(name,1));   
        _mint(account, cardId);
        _setTokenUri(cardId,tokenUri);
    }
}