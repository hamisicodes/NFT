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

    function transferFrom(address _from, address _to, uint256 _tokenId) external {
        // check if token exists
        require(_owners[_tokenId] != address(0), "No such token");
        require(_owners[_tokenId] == _from, "cannot transfer from");
        require(msg.sender == _from, "required to be owner");
        _owners[_tokenId] = _to;
    }


}