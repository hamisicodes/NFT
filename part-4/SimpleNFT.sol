// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Token.sol";

contract OpenZeppelinNFT is ERC721, Ownable{
    uint256 public tokenSupply = 0;
    uint256 public constant MAX_SUPPLY = 5;
    uint256 public constant PRICE = 10;
    SimpleToken public myToken;

    event transactonFailed(address sender, address receiver, uint256 amount);

    constructor(address _token) ERC721("HAMISI-NFT-COLLECTION-1", "HNFT2"){
        myToken = SimpleToken(_token);
    }

    function getTokenBalance() public view returns (uint) {
        return myToken.balanceOf(msg.sender);
    }

    function _tokenTransfer(address _to, uint256 _amount) internal returns (bool) {
        return myToken.transferFrom(msg.sender, _to, _amount);
    }

    function mint() external {
        require(tokenSupply < MAX_SUPPLY, "Supply used up");

        require(
            _tokenTransfer(address(this), PRICE), "Cannot transfer");

        _mint(msg.sender, tokenSupply);
        tokenSupply ++ ;
    }

    function viewBalance() external view  returns (uint256) {
        return address(this).balance ;
    }

    function withdraw() external onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmNa2MV3qzWz6C1MA9a9F2wdPf7E8cTXWgCKMQp5yTLFLf/";
    }

}