import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Level.dart';
import '../data/EnLevel_data.dart';

class LevelPage extends StatefulWidget {
  final String language;
  const LevelPage({Key? key, required this.language}) : super(key: key);

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  int? selectedIndex;
  
  String _getStandardLevel(String levelTitle) {
    if (levelTitle.toLowerCase().contains('i''m still beginner')) return 'A1';
    if (levelTitle.toLowerCase().contains('i kwow some basic words')) return 'A2';
    if (levelTitle.toLowerCase().contains('i can speak a little')) return 'B1';
    return 'Unknown';
  }


  Future<void> _saveLevel(String levelTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final standardLevel = _getStandardLevel(levelTitle);
    await prefs.setString('level', standardLevel);
  }

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
                    'You have some English already?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 210, 25, 96),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ...List.generate(levels.length, (index) {
              Level level = levels[index];
              bool selectIndex = selectedIndex == index;

              return GestureDetector(
                onTap: () async {
                  setState(() {
                    selectedIndex = index;
                  });
                  
                  await _saveLevel(level.LevelTitle);
                  
                  Navigator.pushReplacementNamed(
                    context, 
                    '/enbar',
                    arguments: {
                      'selectedLevel': _getStandardLevel(level.LevelTitle),
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selectIndex 
                        ? const Color.fromARGB(255, 254, 180, 209) 
                        : const Color.fromARGB(255, 210, 25, 96),
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