// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/utils/Strings.sol";

contract SimpleNft {
    using Strings for uint256;

    mapping(uint256 => address) private _owners;
    mapping(address => mapping(address => bool)) private _operators;
    mapping(address => uint256) private _balances;
    string public baseURL = "https://example.com/images/";

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    function mint(uint256 _tokenId) external {
        require(_owners[_tokenId] == address(0), "already minted");
        require(_tokenId < 100, "token id too large");
        _owners[_tokenId] = msg.sender;
        emit Transfer(address(0), msg.sender, _tokenId);

        _balances[msg.sender] += 1;


    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        require(_owners[_tokenId] != address(0), "No such token");
        return _owners[_tokenId];
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external {
        // check if token exists
        require(_owners[_tokenId] != address(0), "No such token");
        require(_owners[_tokenId] == _from, "cannot transfer from");
        require(msg.sender == _from, "required to be owner");
        _owners[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);

        _balances[_from] -= 1;
        _balances[_to] += 1;

    }

    function tokenURI(uint256 _tokenId) external view returns (string memory) {
        require(_owners[_tokenId] != address(0), "No such token");
        return string(abi.encodePacked(baseURL, _tokenId.toString()));
    }

    function setApprovalForAll(address _operator, bool _approved) external {
        _operators[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    function isApprovedForAll(address _owner, address _operator) external view returns (bool) {
        return _operators[_owner][_operator];

    }

    function balanceOf(address _owner) external view returns (uint256) {
        return _balances[_owner];
    }


}
