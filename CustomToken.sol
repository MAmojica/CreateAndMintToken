// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITokenInterface.sol";

contract CustomToken is ITokenInterface {
    string public tokenName;
    string public tokenSymbol;
    uint8 public tokenDecimals;
    uint256 public circulatingSupply;
    address private tokenCreator;

    mapping(address => uint256) private userBalances;

    event TokensBurned(address indexed burner, uint256 amount);
    event TokensCreated(address indexed recipient, uint256 amount);

    constructor(string memory _tokenName, string memory _tokenSymbol, uint8 _tokenDecimals, uint256 _initialMint) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        tokenDecimals = _tokenDecimals;
        circulatingSupply = _initialMint * 10 ** _tokenDecimals;
        userBalances[msg.sender] = circulatingSupply;
        tokenCreator = msg.sender;
    }

    modifier onlyTokenCreator() {
        require(msg.sender == tokenCreator, "Action restricted to token creator");
        _;
    }

    function sendTokens(address _recipient, uint256 _amount) external returns (bool success) {
        require(msg.sender != address(0), "Invalid sender address");
        require(userBalances[msg.sender] >= _amount, "Insufficient balance for transfer");
        
        userBalances[msg.sender] -= _amount;
        userBalances[_recipient] += _amount;
        
        emit TokensSent(msg.sender, _recipient, _amount);
        return true;
    }

    function createTokens(address _recipient, uint256 _amount) external onlyTokenCreator {
        require(_recipient != address(0), "Invalid recipient address");
        require(circulatingSupply + _amount >= circulatingSupply, "Token creation would cause overflow");

        userBalances[_recipient] += _amount;
        circulatingSupply += _amount;

        emit TokensCreated(_recipient, _amount);
    }

    function destroyTokens(uint256 _amount) public {
        require(userBalances[msg.sender] >= _amount, "Insufficient balance for token destruction");

        userBalances[msg.sender] -= _amount;
        circulatingSupply -= _amount;

        emit TokensBurned(msg.sender, _amount);
    }
}
