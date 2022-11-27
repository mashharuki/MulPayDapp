import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/model/contract_model.dart';
import 'package:frontend/view/widgets/navbar.dart';
import 'package:frontend/view/widgets/qr_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web3dart/credentials.dart';

/**
 * Wallet 
 */
class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

/**
 * _WalletState class
 */
class _WalletState extends State<Wallet> {
  Token dropdownValue = ContractModel().tokenList[2];
  // token list
  List<Token> tokenList = ContractModel().tokenList;
  TextEditingController addressController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height;
    final displayWidth = MediaQuery.of(context).size.width;
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    // get contract model
    var contractModel = Provider.of<ContractModel>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.08),
          child: Column(
            children: [
              SizedBox(
                height: displayHeight * 0.04,
              ),
              SizedBox(
                height: displayHeight * 0.05,
                child: Row(
                  children: [
                    Text(
                      'Wallet',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: displayHeight * 0.02,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: HexColor('#D9D9D9'),
                      ),
                      width: double.infinity,
                      height: displayHeight * 0.12,
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "wallet address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            child: Text(
                              contractModel.account,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 35,
                                color: HexColor("#56CCC5"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: displayHeight * 0.01,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => QRCode(
                              qrImage: QrImage(
                            data: contractModel.account,
                            size: 200,
                          )),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 22,
                            width: 22,
                            child: SvgPicture.asset(
                              'assets/pop.svg',
                              color: Colors.grey,
                            ),
                          ),
                          const Text(
                            ' display QR code',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight * 0.1,
                    ),
                    SizedBox(
                      height: displayHeight * 0.19,
                      child: SvgPicture.asset("assets/wallet_screen_img.svg"),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Select coin and push the right button",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      color: HexColor('#D9D9D9'),
                                    ),
                                    width: displayWidth * 0.4,
                                    height: displayHeight * 0.12,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        buttonWidth: 20,
                                        buttonHeight: 20,
                                        customButton: Container(
                                            child: Row(
                                          children: [
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: displayWidth * 0.13,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                        dropdownValue
                                                            .imagePath),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            SizedBox(
                                              height: displayHeight * 0.12,
                                              width: displayWidth * 0.14,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    dropdownValue.symbol,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    dropdownValue.name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: displayHeight * 0.12,
                                              width: 20,
                                              child: SvgPicture.asset(
                                                "assets/triangle.svg",
                                                color: HexColor("#628A8A"),
                                              ),
                                            ),
                                          ],
                                        )),
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          size: 30,
                                          color: HexColor("#628A8A"),
                                        ),
                                        onChanged: (Token? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: tokenList
                                            .map<DropdownMenuItem<Token>>(
                                                (Token value) {
                                          return DropdownMenuItem<Token>(
                                            value: value,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child: Image.asset(
                                                      value.imagePath),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(value.symbol)
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth * 0.05,
                                  ),
                                  Container(
                                    child: SizedBox(
                                      height: displayHeight * 0.08,
                                      width: displayWidth * 0.37,
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          /**
                                           * call sendTransaction
                                           */
                                          await contractModel.sendTransaction(
                                            dotenv.env["SWAP_CONTRACT_NAME"]!,
                                            dotenv
                                                .env["SWAP_CONTRACT_ADDRESS"]!,
                                            "distributeToken",
                                            [
                                              EthereumAddress.fromHex(
                                                  dropdownValue.address),
                                              BigInt.from(100),
                                              EthereumAddress.fromHex(
                                                  contractModel.account),
                                            ],
                                          );
                                        },
                                        child: Text(
                                          'Get 100 ${dropdownValue.symbol}!',
                                          style: GoogleFonts.patuaOne(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            child: SizedBox(
                              height: displayHeight * 0.1,
                              width: displayWidth * 0.7,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/signIn');
                                },
                                child: Text(
                                  'Disconnect',
                                  style: GoogleFonts.patuaOne(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 27,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
