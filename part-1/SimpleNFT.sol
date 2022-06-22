// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleNft {
    mapping(uint256 => address) private _owners;

    function mint(uint256 _tokenId) external {
        require(_owners[_tokenId] == address(0) , "already minted");
        require(_tokenId < 100 , "token id too large");
        _owners[_tokenId] = msg.sender;

    }
    
    function ownerOf(uint256 _tokenId) external view returns (address) {
        require( _owners[_tokenId] != address(0), "No such token");
        return _owners[_tokenId];
    }

}