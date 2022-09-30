const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
import { ethers } from "hardhat";

/**
 * test code
 */
describe("Swap Contract", function () {

    /**
     * deploy function
     */
    async function deployTokenFixture() {
        const [owner, addr1] = await ethers.getSigners();
        
        const daiToken = await ethers.getContractFactory("DaiToken");
        const ethToken = await ethers.getContractFactory("EthToken");
        const auroraToken = await ethers.getContractFactory("AuroraToken");
        const shibainuToken = await ethers.getContractFactory("ShibainuToken");
        const solanaToken = await ethers.getContractFactory("SolanaToken");
        const tetherToken = await ethers.getContractFactory("TetherToken");
        const uniswapToken = await ethers.getContractFactory("UniswapToken");
        const polygonToken = await ethers.getContractFactory("PolygonToken");
        const swapFactory = await ethers.getContractFactory("SwapContract");
        // deploy
        const SwapContract = await swapFactory.deploy();
        const DaiToken = await daiToken.deploy(SwapContract.address);
        const EthToken = await ethToken.deploy(SwapContract.address);
        const AoaToken = await auroraToken.deploy(SwapContract.address);
        const ShibToken = await shibainuToken.deploy(SwapContract.address);
        const SolToken = await solanaToken.deploy(SwapContract.address);
        const UsdtToken = await tetherToken.deploy(SwapContract.address);
        const UniToken = await uniswapToken.deploy(SwapContract.address);
        const MaticToken = await polygonToken.deploy(SwapContract.address);

        return {
            owner,
            addr1,
            DaiToken,
            EthToken,
            AoaToken,
            ShibToken,
            SolToken,
            UsdtToken,
            UniToken,
            MaticToken,
            SwapContract,
        };
    };

    /**
     * deploy test code
     */
    describe("Deployment", function () {
        it("ERC20 token is minted from smart contract", async function () {
            // call deploy function
            const { DaiToken, SwapContract } = await loadFixture(deployTokenFixture);
            // get balance
            const balanceOfDai = await DaiToken.balanceOf(SwapContract.address);
            console.log(balanceOfDai.toString());
        });

        it("Get value between DAI and ETH", async function () {
            // call deploy function
            const { DaiToken, EthToken, SwapContract } = await loadFixture(deployTokenFixture);
            // calculate value
            const value = await SwapContract.calculateValue(
              EthToken.address,
              DaiToken.address
            );

            console.log(
              `value of ETH/DAI is ${
                value / parseInt(ethers.utils.parseEther("1").toString())
              }`
            );
        });

        it("swap function", async function () {
            const { 
                owner, 
                addr1, 
                DaiToken, 
                EthToken, 
                UniToken, 
                SwapContract 
            } = await loadFixture(deployTokenFixture);
      
            // approve
            await DaiToken.approve(
                SwapContract.address,
                ethers.utils.parseEther("200")
            );
            // distribute
            await SwapContract.distributeToken(
              DaiToken.address,
              ethers.utils.parseEther("100"),
              owner.address
            );
            // get balance
            const ethAmountBefore = await DaiToken.balanceOf(addr1.address);
            
            console.log(`Before transfer, address_1 has ${ethAmountBefore.toString()} ETH`);
      
            // swap
            await SwapContract.swap(
                DaiToken.address,
                UniToken.address,
                EthToken.address,
                ethers.utils.parseEther("1"),
                addr1.address
            );
      
            const ethAmountAfter = ethers.utils.formatEther(await EthToken.balanceOf(addr1.address));
            
            console.log(`After transfer, address_1 has ${ethAmountAfter} ETH`);
        });
    });
});