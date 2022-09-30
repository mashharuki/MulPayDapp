require("dotenv").config();
const hre = require("hardhat");

const provider = hre.ethers.provider;
const deployerWallet = new hre.ethers.Wallet(
  process.env.AURORA_PRIVATE_KEY,
  provider
);

/**
 * main method
 */
async function main() {

  console.log("Deploying contracts with the account:", deployerWallet.address);

  console.log(
    "Account balance:",
    (await deployerWallet.getBalance()).toString()
  );

  const swapFactory = await hre.ethers.getContractFactory("SwapContract");
  const daiToken = await hre.ethers.getContractFactory("DaiToken");
  const ethToken = await hre.ethers.getContractFactory("EthToken");
  const aoaToken = await hre.ethers.getContractFactory("AuroraToken");
  const shibToken = await hre.ethers.getContractFactory("ShibainuToken");
  const solToken = await hre.ethers.getContractFactory("SolanaToken");
  const usdtToken = await hre.ethers.getContractFactory("TetherToken");
  const uniToken = await hre.ethers.getContractFactory("UniswapToken");
  const maticToken = await hre.ethers.getContractFactory("PolygonToken");
  // owner address = deployer wallet
  const SwapContract = await swapFactory.connect(deployerWallet).deploy();
  await SwapContract.deployed();

  const [deployer] = await hre.ethers.getSigners();
  console.log(`deployer address is ${deployer.address}`);

  const DaiToken = await daiToken.deploy(SwapContract.address);
  const EthToken = await ethToken.deploy(SwapContract.address);
  const AoaToken = await aoaToken.deploy(SwapContract.address);
  const ShibToken = await shibToken.deploy(SwapContract.address);
  const SolToken = await solToken.deploy(SwapContract.address);
  const UsdtToken = await usdtToken.deploy(SwapContract.address);
  const UniToken = await uniToken.deploy(SwapContract.address);
  const MaticToken = await maticToken.deploy(SwapContract.address);
  // deploy
  await DaiToken.deployed();
  await EthToken.deployed();
  await AoaToken.deployed();
  await ShibToken.deployed();
  await SolToken.deployed();
  await UsdtToken.deployed();
  await UniToken.deployed();
  await MaticToken.deployed();

  console.log("Swap Contract is deployed to:", SwapContract.address);
  console.log("DaiToken is deployed to:", DaiToken.address);
  console.log("EthToken is deployed to:", EthToken.address);
  console.log("AoaToken is deployed to:", AoaToken.address);
  console.log("ShibaToken is deployed to:", ShibToken.address);
  console.log("SolToken is deployed to:", SolToken.address);
  console.log("UsdtToken is deployed to:", UsdtToken.address);
  console.log("UniToken is deployed to:", UniToken.address);
  console.log("MaticToken is deployed to:", MaticToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
