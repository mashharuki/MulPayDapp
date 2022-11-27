import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

/**
 * QRCodeScan
 */
class QRCodeScan extends StatefulWidget {
  const QRCodeScan({Key? key}) : super(key: key);

  @override
  State<QRCodeScan> createState() => _QRCodeScanState();
}

/**
 * _QRCodeScanState class
 */
class _QRCodeScanState extends State<QRCodeScan> {
  final qrKey = GlobalKey(debugLabel: "QR");

  /**
   * Widget buildQrView
   */
  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: HexColor("#0C9DB0"),
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  /**
   * onQRViewCreated function
   */
  void onQRViewCreated(QRViewController controller) {
    setState(
      () {
        this.controller = controller;
      },
    );

    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }

  Barcode? barcode;
  QRViewController? controller;

  /**
   * dispose function
   */
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  /**
   * reassemble function
   */
  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  /**
   * Widget build
   */
  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height;
    final displayWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(
              bottom: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: displayHeight * 0.035,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            barcode != null
                                ? "Recipient Address : "
                                : "Scan a QR code!",
                          ),
                          SizedBox(
                            width: displayWidth * 0.1,
                            child: Text(
                              barcode != null ? "${barcode!.code}" : "",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      barcode != null
                          ? Navigator.pop(context, barcode!.code)
                          : Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        barcode != null ? "get address!" : "back screen",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
