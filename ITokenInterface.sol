// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface ITokenInterface {
    function createTokens(address _recipient, uint256 _amount) external;
    function destroyTokens(uint256 _amount) external;
    function sendTokens(address _recipient, uint256 _amount) external returns (bool success);

    event TokensSent(address sender, address recipient, uint256 amount);
}
