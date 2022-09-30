// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * SwapContract 
 */
contract SwapContract {
    
    address public deployerAddress;
    
    modifier onlyOwner() {
        require(msg.sender == deployerAddress, "Anyone but depoyer can distribute token!");
        _;
    }

    constructor() payable{
        deployerAddress = msg.sender;
    }

    function calculateValue(
        address tokenSendAddress, 
        address tokenRecieveMesureAddress
    ) public view returns (uint256 value) {
        value = (1 ether) * IERC20(tokenSendAddress).balanceOf(address(this)) / ERC20(tokenRecieveMesureAddress).balanceOf(address(this));
    }

    function distributeToken(
        address tokenAddress, 
        uint256 amount, 
        address recipientAddress
    ) public onlyOwner {
        IERC20 token = IERC20(tokenAddress);
        token.transfer(recipientAddress, amount);
    }

    function swap(
        address sendTokenAddress, 
        address measureTokenAddress, 
        address receiveTokenAddress, 
        uint256 amount, 
        address recipientAddress
    ) public payable{

        IERC20 sendToken = IERC20(sendTokenAddress);
        IERC20 receiveToken = IERC20(receiveTokenAddress);

        uint256 sendTokenValue = calculateValue(sendTokenAddress, measureTokenAddress);
        uint256 recieveTokenValue = calculateValue(receiveTokenAddress, measureTokenAddress);
        uint256 sendAmount = amount * sendTokenValue / (1 ether);
        uint256 recieveAmount = amount * recieveTokenValue / (1 ether);

        require(sendToken.balanceOf(msg.sender) >= sendAmount, "Your asset is smaller than amount you want to send");
        require(receiveToken.balanceOf(address(this)) >= recieveAmount, "Contract asset of the currency recipient want is smaller than amount you want to send");

        sendToken.transferFrom(msg.sender, address(this), sendAmount);
        receiveToken.transfer(recipientAddress, recieveAmount);
    }
}