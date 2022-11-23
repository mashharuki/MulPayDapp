# MulPayDapp

Aurora を利用した送金用の Dapp 開発リポジトリです。

### フロントエンド起動方法(事前にエミュレーターを起動させておくこと)

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

### Aurora testnet へのデプロイ記録

```zsh
npm run deploy:aurora
```

```zsh
Downloading compiler 0.8.0
Compiled 7 Solidity files successfully
Deploying contracts with the account: 0x51908F598A5e0d8F1A3bAbFa6DF76F9704daD072
(node:6032) ExperimentalWarning: stream/web is an experimental feature. This feature could change at any time
(Use `node --trace-warnings ...` to show where the warning was created)
Account balance: 9997864624350000000
deployer address is 0x51908F598A5e0d8F1A3bAbFa6DF76F9704daD072
Swap Contract is deployed to: 0x9dbec436843B2f12BAf8A372CC210a0dA8c10281
DaiToken is deployed to: 0x091F9906b37EE1C49a097589B6cfc258a97534F1
EthToken is deployed to: 0x8D649Ae3C6DEf2b21db9867dB92fDA10Fc231a11
AoaToken is deployed to: 0x32D34bc9dAD8c5172b7756357Cc43166a3A2FaFb
ShibaToken is deployed to: 0x677fA3F54bab17C4654A534683F1CEab94278632
SolToken is deployed to: 0x50f2f66Eb93E7B5864c192F197af76D4611Ae7b8
UsdtToken is deployed to: 0x16A39C809bCC52080BB6Ab0828b995524fC3D77b
UniToken is deployed to: 0xB03239d60afB36F245781Bf484D9FcD5bA61C402
MaticToken is deployed to: 0x32F9d19A89b65F91da684ee25136CF692673A160
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

frontend フォルダの直下にも情報を記載することになるので、メモで記載

```zsh
AOA_CONTRACT_ADDRESS = "0x32D34bc9dAD8c5172b7756357Cc43166a3A2FaFb"
SHIB_CONTRACT_ADDRESS = "0x677fA3F54bab17C4654A534683F1CEab94278632"
ETH_CONTRACT_ADDRESS = "0x8D649Ae3C6DEf2b21db9867dB92fDA10Fc231a11"
SOL_CONTRACT_ADDRESS = "0x50f2f66Eb93E7B5864c192F197af76D4611Ae7b8"
USDT_CONTRACT_ADDRESS = "0x16A39C809bCC52080BB6Ab0828b995524fC3D77b"
UNI_CONTRACT_ADDRESS = "0xB03239d60afB36F245781Bf484D9FcD5bA61C402"
MATIC_CONTRACT_ADDRESS = "0x32F9d19A89b65F91da684ee25136CF692673A160"
DAI_CONTRACT_ADDRESS = "0x091F9906b37EE1C49a097589B6cfc258a97534F1"
SWAP_CONTRACT_ADDRESS = "0x9dbec436843B2f12BAf8A372CC210a0dA8c10281"

SWAP_CONTRACT_NAME = "SwapContract"
DAI_CONTRACT_NAME = "DaiToken"
ETH_CONTRACT_NAME = "EthToken"
AOA_CONTRACT_NAME = "AuroraToken"
SHIB_CONTRACT_NAME = "ShibainuToken"
SOL_CONTRACT_NAME = "SolanaToken"
USDT_CONTRACT_NAME = "TetherToken"
UNI_CONTRACT_NAME = "UniswapToken"
MATIC_CONTRACT_NAME = "PolygonToken"
```

### flutter の開発環境チェックコマンド

`flutter doctor`

以下のような結果が出れば OK!

```cmd
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.0.2, on macOS 12.6 21G115 darwin-x64, locale ja-JP)
Checking Android licenses is taking an unexpectedly long time...[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.1)
[✓] Xcode - develop for iOS and macOS (Xcode 14.0.1)
[✓] Chrome - develop for the web
[✓] Android Studio (version 4.0)
[✓] VS Code (version 1.71.2)
[✓] Connected device (2 available)
[✓] HTTP Host Availability

• No issues found!
```

### エミュレーターまでのパス

`cd /Users/xxx/Library/Android/sdk`  

一覧確認コマンド

```zsh
./emulator -list-avds
```

### 参考文献

1. [Aurora](https://aurora.dev/faucet)
2. [Infura](https://infura.io/)
3. [Hardhat Aurora config](https://doc.aurora.dev/interact/hardhat/)
4. [Aurora Scan](https://testnet.aurorascan.dev/)
