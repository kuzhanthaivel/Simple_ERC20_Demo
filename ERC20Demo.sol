// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint256 public tokenPrice = 0 ether;
    address owner; 
    constructor(uint256 initialSupply) ERC20("My Token", "MYT") {
        _mint(msg.sender, initialSupply);
    }

    function transferTokens(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function mintTokens(uint256 amount) public payable {
        require(msg.value >= amount * tokenPrice, "Payment required to mint tokens");
        _mint(msg.sender, amount);
    }
}
