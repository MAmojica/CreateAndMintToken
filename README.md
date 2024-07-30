# CustomToken - ERC20 Token Project

This project implements a custom ERC20 token using OpenZeppelin contracts. The token can be minted by the owner, transferred by any user, and burned by any token holder.

## Deployment Instructions (using Remix)

1. Open Remix IDE (https://remix.ethereum.org/)

2. Create a new file named `CustomToken.sol` and paste the provided contract code.

3. In the "File Explorer" tab, create a new folder named `@openzeppelin`.

4. Inside the `@openzeppelin` folder, create subfolders: `contracts/token/ERC20` and `contracts/access`.

5. In the Remix file explorer, click on the "GitHub" icon (usually in the middle panel).

6. Search for "OpenZeppelin/openzeppelin-contracts" and import the following files:
   - `@openzeppelin/contracts/token/ERC20/ERC20.sol`
   - `@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol`
   - `@openzeppelin/contracts/access/Ownable.sol`

7. In the "Solidity Compiler" tab:
   - Select compiler version 0.8.26 or later
   - Click "Compile CustomToken.sol"

8. In the "Deploy & Run Transactions" tab:
   - Select "Injected Web3" as the environment (ensure MetaMask is connected)
   - Select "CustomToken" from the contract dropdown
   - Fill in the constructor parameters:
     - name: Your token name (e.g., "MyToken")
     - symbol: Your token symbol (e.g., "MTK")
     - decimalsAmount: Number of decimal places (e.g., 18)
   - Click "Deploy"

9. Confirm the transaction in MetaMask

## Interacting with the Contract

After deployment, you can interact with the contract using Remix's interface:

1. Minting tokens (only owner):
   - Expand the deployed contract
   - Find the "mint" function
   - Enter the recipient address and amount (in wei)
   - Click "transact" and confirm in MetaMask

2. Transferring tokens:
   - Use the "transfer" function
   - Enter the recipient address and amount
   - Click "transact" and confirm in MetaMask

3. Burning tokens:
   - Use the "burn" function
   - Enter the amount to burn
   - Click "transact" and confirm in MetaMask

4. Checking balance:
   - Use the "balanceOf" function
   - Enter an address to check its balance

## Notes

- Ensure you're connected to the desired network in MetaMask before deploying
- The account used to deploy the contract becomes the owner
- All token amounts are in wei (smallest unit). For example, 1 token with 18 decimals is represented as 1000000000000000000
