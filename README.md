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

### flutterの開発環境チェックコマンド
 `flutter doctor`  

 以下のような結果が出ればOK!
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

### 参考文献
1. [Aurora](https://aurora.dev/faucet)
2. [Infura](https://infura.io/)
3. [Hardhat Aurora config](https://doc.aurora.dev/interact/hardhat/)