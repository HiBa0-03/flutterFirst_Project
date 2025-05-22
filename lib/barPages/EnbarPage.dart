import 'package:flutter/material.dart';
import '../pages/Profile/profilePage.dart';
import '../pages/quiz/processPage.dart';
import '../pages/home/homePage_english.dart';
 class enBarPage extends StatefulWidget {
  const enBarPage ({Key? key}) :super(key: key);
  

  @override
  State<enBarPage> createState() => _enBarPage();
}

class _enBarPage extends State<enBarPage> {
 
 int selectedIndex = 0;
  static List<Widget> tabBarPages = [
    const HomePage_english(),
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.border_color_rounded), label: 'process'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}