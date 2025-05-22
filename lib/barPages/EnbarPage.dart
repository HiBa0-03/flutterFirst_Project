import 'package:flutter/material.dart';
import '../pages/Profile/profilePage.dart';
import '../pages/quiz/processPage.dart';
import '../pages/home/homePage_englishA1.dart';
 class enBarPage extends StatefulWidget {
   final String selectedLevel;
  const enBarPage ({Key? key, required this.selectedLevel}) :super(key: key);
  

  @override
  State<enBarPage> createState() => _enBarPage();
}

class _enBarPage extends State<enBarPage> {
 
 int selectedIndex = 0;
  late List<Widget> tabBarPages ;
  void initState() {
    super.initState();
    tabBarPages = [
      HomePage_english(language: 'english', level: widget.selectedLevel),
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
      backgroundColor:    Color.fromARGB(255, 252, 172, 207),
      selectedItemColor:  Color.fromARGB(255, 236, 103, 161),

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