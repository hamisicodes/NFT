#### Explain the differences between ERC721 and ERC1155. Specifically, explain how the transfer functions differ.

ERC721 is a standard for contracts that manage Non-Fungible Tokens. This standard provides basic functionality to track and transfer NFTs.

ER1155 is a standard  for contracts that manage multiple token types. A single deployed contract may include any combination of fungible tokens, non-fungible tokens or other configurations (e.g. semi-fungible tokens).

Unlike ERC721, the ERC1155 has the ability to batchtransfer tokens of different types in one function. These
are included in an array which is one of the `safeBatchTransferFrom` function arguments.

```javascript
/*
    @param _from    Source address
    @param _to      Target address
    @param _ids     IDs of each token type (order and length must match _values array)
    @param _values  Transfer amounts per token type (order and length must match _ids array)
    @param _data    Additional data with no specified format, MUST be sent unaltered in call to the `ERC1155TokenReceiver` hook(s) on `_to`
*/
function safeBatchTransferFrom(address _from, address _to, uint256[] calldata _ids, uint256[] calldata _values, bytes calldata _data) external;

```
The transfer function for a ERC721 standard is capable of transferring only one token type  which is passed as `token_id` parameter in `safeTransferFrom` function

```javascript
    /// @param _from The current owner of the NFT
    /// @param _to The new owner
    /// @param _tokenId The NFT to transfer
    /// @param data Additional data with no specified format, sent in call to `_to`
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
```

#### Explain how 1155 is capable of providing non-fungible tokens the way ERC721 can (hint read the original EIP).
By specifying the amount of a given token to be minted as one, It shows that the token is non-fungible.

