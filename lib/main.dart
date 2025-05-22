import 'package:flutter/material.dart';
import 'package:hib_testflu/barPages/EnbarPage.dart';
import 'package:hib_testflu/barPages/FrbarPage.dart';
import 'package:hib_testflu/pages/Login/Loginscreen.dart';
import 'package:hib_testflu/pages/Login/regScreen.dart';
import 'package:hib_testflu/pages/home/homePage_englishA1.dart';
import 'package:hib_testflu/pages/home/homePage_frenshA1.dart';
import 'package:hib_testflu/pages/home/video_list_page.dart';
import 'package:hib_testflu/widgets/FRLevel%20.dart';
import 'package:hib_testflu/widgets/Language.dart';
import 'Pages/Login/splashScreen.dart';
import 'package:hib_testflu/widgets/ENLevel.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
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
        '/login':(context) => const Loginscreen(),
        '/register': (context) => const RegScreen(),
        '/english': (context) => const HomePage_english(language: 'english',level: '',),
        '/french': (context) => const homePage_frensh(language: 'english',level: '',),
        '/Levelen': (context) => const LevelPage(language: 'english',),
        '/Levelfr': (context) => const LevelPage2(language: 'french',),
        '/language': (context) => const Language(),
        '/enbar': (context) {
         final args = ModalRoute.of(context)?.settings.arguments as Map?;
    return enBarPage(
      selectedLevel: args?['selectedLevel'] ?? 'A1',
    );
  },
      '/frbar': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    return frbarPage(
      selectedLevel: args?['selectedLevel'] ?? 'A1',
    );
  },
        '/cours': (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return VideoListPage (
      language: args['language'],
      level: args['level'],
      category: args['category'],
    );
  },
        },
    theme:ThemeData(
      fontFamily: ('inter'),
      useMaterial3: true,
    ),
    home: const SplashScreen(),
   // home: const Language(),
    //home:LevelPage(),
      //  home:HomePage_english(),

    );
  }
}
