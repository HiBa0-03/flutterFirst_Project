import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
    Future<void> _saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: ()async {
         // Navigator.pushNamed(context, '/enbar');
         await _saveLanguage('english');
          Navigator.pushNamed(context, '/Levelen',arguments: "english");
        },
         style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
          child:Ink.image(
            image: AssetImage('assets/images/uk.png'),
            width: 100,
            height: 100,
       
           
        )
      ),
      ElevatedButton(
        onPressed: () async{
           await _saveLanguage('french');
         // Navigator.pushNamed(context, '/frbar');
          Navigator.pushNamed(context, '/Levelfr',arguments: "french");
        },
        style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
          child:Ink.image(
            image: AssetImage('assets/images/france.png'),
            width: 100,
            height: 100,
          ),
          
        )
       
    ],
    
  ),
),
    );
  }
}
