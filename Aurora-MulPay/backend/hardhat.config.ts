import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@typechain/hardhat";
require("dotenv").config();

const {
  AURORA_PRIVATE_KEY
} = process.env;

/**
 * hardhat config 
 */
const config: HardhatUserConfig = {
  solidity: "0.8.0",
  networks: {
    // aurora testnet
    testnet_aurora: {
      url: "https://testnet.aurora.dev",
      accounts: [`0x${AURORA_PRIVATE_KEY}`],
      chainId: 1313161555,
      timeout: 9000000,
      gas: 2000000
    },
    develop_aurora: {
      url: 'https://develop.rpc.testnet.aurora.dev:8545',
      accounts: [`0x${AURORA_PRIVATE_KEY}`]
    },
    ropsten: {
      url: 'https://rpc.testnet.aurora.dev:8545',
      accounts: [`0x${AURORA_PRIVATE_KEY}`]
    }
  },
};

export default config;
