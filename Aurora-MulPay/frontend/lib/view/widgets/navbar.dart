import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend/view/screens/home.dart';
import 'package:frontend/view/screens/send.dart';
import 'package:frontend/view/screens/wallet.dart';
import 'package:provider/provider.dart';
import 'package:hexcolor/hexcolor.dart';

/**
 * BottomNavigationBarProvider
 */
class BottomNavigationBarProvider with ChangeNotifier {
    int _currentIndex = 0;

    int get currentIndex => _currentIndex;

    set currentIndex(int index) {
        _currentIndex = index;
        notifyListeners();
    }
}

/**
 * BottomNavigationBarWidget
 */
class BottomNavigationBarWidget extends StatefulWidget {
    const BottomNavigationBarWidget({Key? key}) : super(key: key);

    @override
    State<BottomNavigationBarWidget> createState() => _BottomNavigationBarState();
}

/**
 * _BottomNavigationBarState
 */
class _BottomNavigationBarState extends State<BottomNavigationBarWidget> {

    var currentTab = [
        const Home(),
        const Send(),
        const Wallet(),
    ];

    @override
    Widget build(BuildContext context) {
        var provider = Provider.of<BottomNavigationBarProvider>(context);
        
        return Scaffold(
            body: currentTab[provider.currentIndex],
            bottomNavigationBar: FluidNavBar(
                icons: [
                    FluidNavBarIcon(
                        svgPath: "assets/home.svg",
                        extras: {"label": "home"},
                        backgroundColor: provider.currentIndex == 0 ? HexColor("#0C9DB0") : Colors.black,
                    ),
                    FluidNavBarIcon(
                        svgPath: "assets/pay.svg",
                        extras: {"label": "send"},
                        backgroundColor: provider.currentIndex == 1 ? HexColor("#0C9DB0") : Colors.black,
                    ),
                    FluidNavBarIcon(
                        svgPath: "assets/wallet.svg",
                        extras: {"label": "wallet"},
                        backgroundColor: provider.currentIndex == 2 ? HexColor("#0C9DB0") : Colors.black,
                    )
                ],
                onChange: (index) => {
                    provider.currentIndex = index,
                },
                style: const FluidNavBarStyle(
                    iconUnselectedForegroundColor: Colors.grey,
                    iconSelectedForegroundColor: Colors.white,
                    barBackgroundColor: Colors.black,
                ),
                scaleFactor: 5,
                defaultIndex: 0,
                itemBuilder: (icon, item) => Semantics(
                    label: icon.extras!["label"],
                    child: item,
                ),
                animationFactor: 0.7,
            ),
        );
    }
}