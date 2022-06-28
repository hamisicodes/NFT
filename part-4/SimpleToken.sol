// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken is ERC20, Ownable{
    mapping (address => uint256) private _payments;
    
    constructor() ERC20("MYTOKEN","MT") {

    }

    // user can mint any number of tokens. 25 tokens per mint
    function mint() public {
        _mint(msg.sender, 25);
    }

    function viewBalance() public view onlyOwner returns (uint256){
        return address(this).balance;
    }

    function withdraw() public onlyOwner {
       payable(msg.sender).transfer(address(this).balance);
    }

}