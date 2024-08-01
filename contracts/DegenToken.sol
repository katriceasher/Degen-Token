// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    struct Item {
        uint itemCost;
        string item;
        bool redeemed;
    }

    Item[] private itemsCatalog; 

    event ItemRedeemed(address indexed user, uint256 itemId, string item);

    constructor() ERC20("Degen", "DGN") {
        // Initialize items
        itemsCatalog.push(Item(5, "Stellar Jades Package", false));
        itemsCatalog.push(Item(10, "Blessing of the Welkin Goddess", false));
        itemsCatalog.push(Item(15, "Nameless Honor - Season 2", false));
    }

    // Create tokens
    function createTokens(address destination, uint256 amount) public onlyOwner {
        _mint(destination, amount);
    }

    // Transfer Tokens
    function transferTokens(address destination, uint256 amount) public returns (bool) {
        require(balanceOf(_msgSender()) >= amount, "DegenToken: insufficient balance for transfer");
        _transfer(_msgSender(), destination, amount);
        return true;
    }

    // Redeem item
    function redeemItem(uint256 itemId) public {
        require(itemId < itemsCatalog.length, "DegenToken: invalid item ID");
        Item storage item = itemsCatalog[itemId];
        require(balanceOf(_msgSender()) >= item.itemCost, "DegenToken: insufficient balance to redeem item");
        require(!item.redeemed, "DegenToken: item already redeemed");

        _burn(_msgSender(), item.itemCost);
        item.redeemed = true;

        emit ItemRedeemed(_msgSender(), itemId, item.item);
    }

    // Check balance
    function verifyBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Burn tokens
    function destroyTokens(uint256 amount) public {
        require(balanceOf(_msgSender()) >= amount, "DegenToken: insufficient balance to burn");
        _burn(_msgSender(), amount);
    }

    // Get item details
    function getItem(uint256 itemId) public view returns (uint, string memory, bool) {
        require(itemId < itemsCatalog.length, "DegenToken: invalid item ID");
        Item memory item = itemsCatalog[itemId];
        return (item.itemCost, item.item, item.redeemed);
    }

    // Get all items
    function displayItems() public view returns (Item[] memory) {
        return itemsCatalog;
    }
}
