https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol

and here

https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Pausable.sol

What added Functionalities do these contracts offer?

1. ERC721URIStorage - adds storage based token URI management ability to the NFT. 3 functions: 

```javascript
_setTokenURI(token_id, _tokenURI) // sets _tokenURI as the token URI of token_id
_tokenURI(tokenId) // Returns a token URI
_burn() // checks to see if a token-specific URI was set for the token, and if so, it deletes the token URI from the storage mapping.

```

1. ERC721Pausable - ERC721 token with pausable token transfers, minting and burning.

    -  Useful for scenarios such as preventing trades until the end of an evaluation period
    -  Having an emergency switch for freezing all token transfers in the event of a large bug.

```javascript
_beforeTokenTransfer(from, to, amount) //condition: The contract must not be paused

```

What are the risks of the Pausable contract?