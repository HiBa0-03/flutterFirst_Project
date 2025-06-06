import 'package:flutter/material.dart';
import 'package:hib_testflu/pages/home/homePage_frenshA1.dart';
import 'package:hib_testflu/pages/Profile/profilePage.dart';
import 'package:hib_testflu/pages/quiz/processPage.dart';
class frbarPage extends StatefulWidget {
  final String selectedLevel;
  const frbarPage ({Key? key, required this.selectedLevel}) :super(key: key);

  @override
  State<frbarPage> createState() => _frbarPageState();
}

class _frbarPageState extends State<frbarPage> {
  
 int selectedIndex = 0;
 late List<Widget> tabBarPages ;
  void initState() {
    super.initState();
    tabBarPages = [
      homePage_frensh(language: 'french', level: widget.selectedLevel),
      const ProcessPage(), 
      const Profilepage(),
    ];
  }
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
      backgroundColor: Color.fromARGB(255, 252, 172, 207),
      selectedItemColor: Color.fromARGB(255, 236, 103, 161),
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
