import 'package:flutter/material.dart';
import 'package:hib_testflu/barPages/EnbarPage.dart';
import 'package:hib_testflu/barPages/FrbarPage.dart';
import 'package:hib_testflu/pages/home/homePage_english.dart';
import 'package:hib_testflu/pages/home/homePage_frensh.dart';
import 'package:hib_testflu/widgets/FRLevel%20.dart';
import 'package:hib_testflu/widgets/Language.dart';
import 'Pages/Login/splashScreen.dart';
import 'package:hib_testflu/widgets/ENLevel.dart';


void main() {
  runApp(  MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
      routes: {
        '/english': (context) => const HomePage_english(),
        '/enbar': (context) => const enBarPage(),
        '/frbar': (context) => const frbarPage(),
        '/french': (context) => const homePage_frensh(),
        '/Levelen': (context) => const LevelPage(),
        '/Levelfr': (context) => const LevelPage2(),
        '/language': (context) => const Language(),

        },
    theme:ThemeData(
      fontFamily: ('inter'),
      useMaterial3: true,
    ),
    home: const SplashScreen(),
   // home: const Language(),
    //home:LevelPage(),
    );
  }
}
