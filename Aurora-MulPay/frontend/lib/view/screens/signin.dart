import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:mulpay_frontend/model/contract_model.dart';
import 'package:mulpay_frontend/view/screens/home.dart';
import 'package:mulpay_frontend/view/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:web3_connect/web3_connect.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

/**
 * SignIn
 */
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  final connection = Web3Connect();
  final String _rpcUrl = "https://testnet.aurora.dev";
  // client
  final _client = Web3Client(
    "https://testnet.aurora.dev", 
    Client(), 
    socketConnector: () {
      return IOWebSocketChannel.connect("wss://testnet.aurora.dev").cast<String>();
    }
  );

  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height;
    final displayWidth = MediaQuery.of(context).size.width;
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/multiple-coins.jpg"),
                alignment: const Alignment(-0.4, 0.5),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: displayHeight * 0.1,
                ),
                ShaderMask(
                  blendMode: BlendMode.modulate,
                  shaderCallback: (size) => LinearGradient(
                    colors: [HexColor("#7AD6FE"), HexColor("#04494E")],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(
                    Rect.fromLTWH(0, 0, size.width, size.height),
                  ),
                  child: const Text(
                    "MulPay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight * 0.03,
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'You can make a payment\n with multiple kinds of coin',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: displayHeight * 0.5,
                ),
                SizedBox(
                  height: displayHeight * 0.1,
                  width: displayWidth * 0.7,
                  child: ElevatedButton(
                    onPressed: () async {
                      connection.enterChainId(1313161555);
                      connection.enterRpcUrl(_rpcUrl);
                      await connection.connect();
                      if (connection.account != "") {
                        await context
                            .read<ContractModel>()
                            .setConnection(connection);
                        provider.currentIndex = 0;
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    child: Text(
                      'Connect Wallet',
                      style: GoogleFonts.patuaOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 27,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
