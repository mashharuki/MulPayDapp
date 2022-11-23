import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/**
 * Coins widget
 */
Widget Coins(
    double displayWidth, 
    displayHeight, 
    String imagePath, 
    symbol, 
    name,
    depo, 
    value
) {

    return Container(
        height: displayHeight * 0.08,
        width: displayWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: displayHeight * 0.008),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(20),
            ),
            color: HexColor('#054C74'),
        ),
        child: Row(
          children: [
            Row(
                children: [
                    SizedBox(
                        height: 37,
                        width: 37,
                        child: Image.asset(imagePath),
                    ),
                    const SizedBox(width: 13,),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                symbol,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14,
                                ),
                            ),
                            Text(
                                name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                            ),
                        ],
                    ),
                ],
            ),
            Expanded(
                child: SizedBox(),
            ),
            SizedBox(
                width: displayWidth * 0.18,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            '${depo} ${symbol}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                            ),
                        ),
                        Text(
                            '${value} ETH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12
                            ),
                        ),
                    ],
                ),
            ),
          ]
        )
    );
}