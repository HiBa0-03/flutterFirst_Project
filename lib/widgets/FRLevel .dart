import 'package:flutter/material.dart';
import '../model/Level.dart';
import '../data/FRLevel_data .dart';
class LevelPage2 extends StatefulWidget {
  const LevelPage2({Key? key}) : super(key: key);

  @override
  State<LevelPage2> createState() => _LevelPage2State();
}

class _LevelPage2State extends State<LevelPage2> {
  int? selectedIndex;
  


  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                Image.asset(
                  'assets/images/bird.png',
                  height: 60,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Vous connaissez déjà un peu Français ?',
                    style: TextStyle(
                      color:const Color.fromARGB(255, 210, 25, 96),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ...List.generate(levels2.length, (index) {
              Level level = levels2[index];
              bool selectIndex = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectIndex ? const Color.fromARGB(255, 254, 180, 209) : const Color.fromARGB(255, 210, 25, 96) ,
                    borderRadius: BorderRadius.circular(12),
                    border: selectIndex
                        ? Border.all(color: const Color.fromARGB(255, 254, 180, 209), width: 2)
                        : null,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        level.LevelIconPath,
                        height: 28,
                        width: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          level.LevelTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Icon(
                        selectIndex ? Icons.check_circle : Icons.arrow_forward_ios,
                        color: Colors.white70,
                        size: selectIndex ? 24 : 16,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}