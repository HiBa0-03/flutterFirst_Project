import 'package:flutter/material.dart';
import 'package:hib_testflu/data/FRLevel_data%20.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Level.dart';
class LevelPage2 extends StatefulWidget {
  final String language;
  const LevelPage2({Key? key, required this.language}) : super(key: key);

  @override
  State<LevelPage2> createState() => _LevelPage2State();
}

class _LevelPage2State extends State<LevelPage2> {
  int? selectedIndex;
  
 String _getStandardLevel(String levelTitle) {
  if (widget.language == 'french') {
    switch (levelTitle) {
      case 'Je suis encore débutant':
        return 'A1';
      case 'Je connais quelques mots de base':
        return 'A2';
      case 'Je peux parler un peu':
        return 'B1';
      default:
        return 'Unknown';
    }
  }
  return 'Unknown';
  }
  Future<void> _saveLevel(String  LevelTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final standardLevel = _getStandardLevel( LevelTitle);
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
                    'Vous connaissez déjà un peu Français ?',
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
            ...List.generate(levels2.length, (index) {
              Level level = levels2[index];
              bool selectIndex = selectedIndex == index;

              return GestureDetector(
                onTap: () async {
                  setState(() {
                    selectedIndex = index;
                  });
                  
                  await _saveLevel(level.LevelTitle);
                  
                  Navigator.pushReplacementNamed(
                    context, 
                    '/frbar',
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