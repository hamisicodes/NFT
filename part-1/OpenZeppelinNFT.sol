// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OpenZeppelinNFT is ERC721, Ownable{
    uint256 public tokenSupply = 0;
    uint256 public constant MAX_SUPPLY = 5;
    uint256 public constant PRICE = 1 ether;

    constructor () ERC721("HAMISI_NFT", "HNFT") {

    }

    function mint() external payable {
        require(tokenSupply < MAX_SUPPLY, "Supply used up");
        require(msg.value == PRICE, "wrong price");
        _mint(msg.sender, tokenSupply);
        tokenSupply ++ ;
    }

    function viewBalance() external view  returns (uint256) {
        return address(this).balance ;
    }

    function withdraw() external onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }

}