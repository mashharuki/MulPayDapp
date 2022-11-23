import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/model/contract_model.dart';
import 'package:frontend/view/screens/signin.dart';
import 'package:frontend/view/widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

/**
 * main function
 */
Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (BuildContext context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContractModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web3 MulPay Dapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: HexColor("#57A8BA"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            shadowColor: Colors.black,
            elevation: 10,
          ),
        ),
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: GoogleFonts.baloo2().fontFamily,
            fontSize: 36,
            height: 1.0,
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: HexColor('#C1E3F5'),
      ),
      routes: {
        '/signIn': (context) => SignIn(),
        '/home': (context) => const BottomNavigationBarWidget(),
      },
      initialRoute: '/signIn',
    );
  }
}
