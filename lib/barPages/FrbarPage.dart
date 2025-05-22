import 'package:flutter/material.dart';
import 'package:hib_testflu/pages/home/homePage_frensh.dart';
import 'package:hib_testflu/pages/Profile/profilePage.dart';
import 'package:hib_testflu/pages/quiz/processPage.dart';
class frbarPage extends StatefulWidget {
  const frbarPage({super.key});

  @override
  State<frbarPage> createState() => _frbarPageState();
}

class _frbarPageState extends State<frbarPage> {
  
 int selectedIndex = 0;
  static List<Widget> tabBarPages = [
    const homePage_frensh(),
    const ProcessPage(), 
     const Profilepage(),   
  ];
  void onTap(int index) {
    setState(() {
      selectedIndex = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: tabBarPages[selectedIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
  BottomNavigationBar bottomNavigationBar(BuildContext) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 244, 65, 163),
      selectedItemColor: const Color.fromARGB(255, 236, 8, 137),
      unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page d''accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.border_color_rounded), label: 'évolution'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}