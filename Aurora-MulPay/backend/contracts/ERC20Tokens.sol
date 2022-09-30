// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DaiToken is ERC20 {
    constructor(address contractAddress) ERC20('Dai Token', "DAI") {
        _mint(contractAddress, 1000000 ether);
    }
}

contract EthToken is ERC20 {
    constructor(address contractAddress) ERC20('Ethereum Token', "ETH") {
        _mint(contractAddress, 100000 ether);
    }
}

contract AuroraToken is ERC20 {
    constructor(address contractAddress) ERC20('Aurora Token', "AOA") {
        _mint(contractAddress, 1000000 ether);
    }
}

contract ShibainuToken is ERC20 {
    constructor(address contractAddress) ERC20('Shibainu Token', "SHIB") {
        _mint(contractAddress, 1000000 ether);
    }
}
contract SolanaToken is ERC20 {
    constructor(address contractAddress) ERC20('Solana Token', "SOL") {
        _mint(contractAddress, 1000000 ether);
    }
}
contract TetherToken is ERC20 {
    constructor(address contractAddress) ERC20('Tether Token', "USDT") {
        _mint(contractAddress, 1000000 ether);
    }
}
contract UniswapToken is ERC20 {
    constructor(address contractAddress) ERC20('Uniswap Token', "UNI") {
        _mint(contractAddress, 1000000 ether);
    }
}

contract PolygonToken is ERC20 {
    constructor(address contractAddress) ERC20('Polygon Token', "Matic") {
        _mint(contractAddress, 1000000 ether);
    }
}