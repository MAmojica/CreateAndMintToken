# Create and Mint Token Project

## Overview

CustomToken is a flexible and secure implementation of a token system similar to ERC20 tokens on the Ethereum blockchain. This project consists of two main components: the CustomToken contract and the ITokenInterface.

## Features

- Create and manage a custom token with a name, symbol, and decimal places
- Mint new tokens (token creation)
- Burn existing tokens (token destruction)
- Transfer tokens between addresses
- Security measures to prevent common vulnerabilities

## Contract Files

1. `CustomToken.sol`: The main contract implementing the token functionality
2. `ITokenInterface.sol`: An interface defining the core functions of the token

## Requirements

- Solidity ^0.8.26
- Ethereum development environment (e.g., Remix, Truffle, or Hardhat)

## Deployment

To deploy the CustomToken contract, you'll need to provide the following parameters:

- `_tokenName`: The name of your token
- `_tokenSymbol`: The symbol (ticker) of your token
- `_tokenDecimals`: The number of decimal places for token amounts
- `_initialMint`: The initial supply of tokens to create

Example deployment using Remix:

1. Open Remix IDE (https://remix.ethereum.org/)
2. Create new files for `CustomToken.sol` and `ITokenInterface.sol`, and paste the respective code
3. Compile the contracts using Solidity Compiler 0.8.26
4. Navigate to the "Deploy & Run Transactions" tab
5. Select "CustomToken" from the contract dropdown
6. Fill in the constructor parameters
7. Click "Deploy" and confirm the transaction

## Main Functions

- `sendTokens(address _recipient, uint256 _amount)`: Transfer tokens to another address
- `createTokens(address _recipient, uint256 _amount)`: Mint new tokens (only callable by token creator)
- `destroyTokens(uint256 _amount)`: Burn tokens

## Events

- `TokensSent(address sender, address recipient, uint256 amount)`: Emitted when tokens are transferred
- `TokensBurned(address indexed burner, uint256 amount)`: Emitted when tokens are burned
- `TokensCreated(address indexed recipient, uint256 amount)`: Emitted when new tokens are minted

## Security Considerations

- The contract includes checks for overflow and underflow
- Certain functions are restricted to the token creator
- The contract prevents interactions with the zero address

## License

This project is licensed under the MIT License.

## Disclaimer

This code is provided as-is and has not been audited. Use at your own risk in production environments.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check issues page if you want to contribute.

## Contact

For any questions or concerns, please open an issue in the project repository.
