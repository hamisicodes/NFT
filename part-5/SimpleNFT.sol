// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleNFT is ERC721, Ownable{
    uint256 public tokenSupply = 0;
    uint256 public constant MAX_SUPPLY = 5;

    constructor() ERC721("HAMISI-NFT-COLLECTION-3", "HNFT3"){
    }


    function mint() external {
        require(tokenSupply < MAX_SUPPLY, "Supply used up");

        _mint(msg.sender, tokenSupply);
        tokenSupply ++ ;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmNa2MV3qzWz6C1MA9a9F2wdPf7E8cTXWgCKMQp5yTLFLf/";
    }

}