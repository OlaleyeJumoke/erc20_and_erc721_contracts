// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract JumokeOlaleye is ERC20, Ownable {
    uint256 public rate = 1000 * 10 ** decimals();
    constructor() ERC20("JumokeOlaleye", "JOT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyTokens(address receiver) public payable{
        require(msg.value > 0, "You can not mint, your balance is low");
        uint256 amount = msg.value ** decimals() * rate;
        _mint(receiver, amount);
    }

}
