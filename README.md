# MulPayDapp
Auroraを利用した送金用のDapp開発リポジトリです。

### フロントエンド起動方法
 `cd frontend && flutter run`

### テスト実行
 `cd backend && npx hardhat test`

 ```cmd
 Swap Contract
    Deployment
1000000000000000000000000
      ✔ ERC20 token is minted from smart contract (4901ms)
value of ETH/DAI is 0.1
      ✔ Get value between DAI and ETH
Before transfer, address_1 has 0 ETH
After transfer, address_1 has 0.1 ETH
      ✔ swap function (87ms)


  3 passing (5s)
 ```

### 参考文献
1. [Aurora](https://aurora.dev/faucet)
2. [Infura](https://infura.io/)