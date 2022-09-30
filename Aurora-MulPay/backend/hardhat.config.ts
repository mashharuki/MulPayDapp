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
      url: "https://testnet.aurora.dev/",
      accounts: [AURORA_PRIVATE_KEY!],
    },
  },
};

export default config;
