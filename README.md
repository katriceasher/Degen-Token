# DegenToken Project
This repository contains the files for the DegenToken smart contract, developed as part of the ETH + AVAX PROOF: Intermediate EVM Course.

## Overview of the Project
DegenToken is an ERC20 token named "Degen" (symbol: DGN) designed for the Degen Gaming platform. The contract is deployed on the Avalanche network and offers the following functionalities:

```createTokens()```: Allows the contract owner to mint new tokens. Requires the owner's address and the amount to mint.

```transferTokens()```: Enables users to transfer tokens to another address. Requires the recipient's address and the transfer amount. The sender's balance must be sufficient to cover the transfer.

```redeemItem()```: Lets users redeem items from an in-game store using tokens. Requires the item ID and burns tokens equivalent to the item cost. The user's balance must be sufficient, and the item must not have been redeemed previously.

```verifyBalance()```: Allows users to check the token balance of a specific account. Requires the account address.

```destroyTokens()```: Enables users to burn tokens from their account. Requires the amount to be burned and ensures the balance is sufficient.

```getItem()```: Provides details of a specific item from the store. Requires the item ID.

```displayItems()```: Displays all available items in the in-game store.

## Pre-requisites
To run this project, you will need:

A Metamask account with available balance (AVAX)
Remix IDE and Solidity Compiler
Node.js
Executing the Program

## Setting up the Project
Clone this repository to your local device using GitHub Desktop or the terminal. <br>
Open a terminal in the project's root directory. <br>
Execute ```npm install``` in the terminal and wait for the installation to complete. <br>
In the same terminal, run remixd. <br>
Open your web browser and navigate to Remix IDE. <br>
On Remix, select the File Explorer tab. <br>
Under Workspaces, select "Connect to localhost" and click "Connect." <br>

## Deploying the Project
Navigate to Remix IDE. <br>
Go to the Solidity Compiler tab and select "Compile DegenToken.sol." <br>
Go to the Deploy and Run Transactions tab. <br>
Under "Environment," choose "Injected Provider - MetaMask." <br>
Verify that MetaMask is connected to the Avalanche Fuji Testnet. <br>
Deploy the contract via the "Deploy" button. <br>

Help
If you have any technical concerns, kindly refer to the official ERC20 documentation and Remix IDE guides for additional guidance.

## Authors

Katrice Asher G. Albano
