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

### pub get とは
`pubspec.yaml`ファイルに記述されているパッケージをダウンロードしてくれるコマンド  
`flutter pub get`

### pub get check
`flutter pub run flutter_launcher_icons:main`

```cmd
Set "remove_alpha_ios: true" to remove it.

• Overwriting default iOS launcher icon with new icon
Creating Icons for Web...
⚠️Requirments failed for platform Web. Skipped
Creating Icons for Windows...
⚠️Windows config is not provided or windows.generate is false. Skipped...
⚠️Requirments failed for platform Windows. Skipped

✓ Successfully generated launcher icons
```

### 参考文献
1. [Aurora](https://aurora.dev/faucet)
2. [Infura](https://infura.io/)
3. [Hardhat Aurora config](https://doc.aurora.dev/interact/hardhat/)