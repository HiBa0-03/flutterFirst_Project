import 'package:flutter/material.dart';
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: () {
         // Navigator.pushNamed(context, '/enbar');
          Navigator.pushNamed(context, '/Levelen');
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
        onPressed: () {
         // Navigator.pushNamed(context, '/frbar');
          Navigator.pushNamed(context, '/Levelfr');
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
