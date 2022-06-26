// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract FreeNFT is ERC721 {
    uint256 public tokenSupply = 0;
    uint256 public constant MAX_SUPPLY = 10;


    constructor() ERC721("HAMISI-NFT", "HNFT") {

    }

    function mint() public {
        require(tokenSupply < MAX_SUPPLY, "Supply used up");
        _mint(msg.sender, tokenSupply);
    }


}