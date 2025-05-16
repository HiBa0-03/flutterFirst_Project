import 'package:flutter/material.dart';
import 'package:hib_testflu/pages/Login/Loginscreen.dart';
import 'package:hib_testflu/pages/Login/RegScreen.dart';


class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);
  @override
    _Welcomescreen createState() => _Welcomescreen();

}

class _Welcomescreen extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color.fromARGB(255, 236, 103, 161),
            Color.fromARGB(255, 252, 172, 207),

              ]
           )
        ),
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.only(top:150.0),
              ),
               ClipOval(
             child: Image.asset('assets/images/BonSpeakerAPP.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              ),
               ),

               SizedBox(
                height: 50,
               ),
               Text('welcome to your favorite App',style: TextStyle(
                 fontSize: 23,
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'PlaywriteRO-Regular'
          
                 ),),
                 SizedBox( height: 30,),
                 GestureDetector(
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Loginscreen()));
                  },
                   child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center (child:Text('SIGN IN',style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                   fontFamily: 'PlaywriteRO-Regular'
          

                   ),
                   ),),
                   ),
                 ),
                 SizedBox( height: 20,),
                GestureDetector(
                  onTap: ( ){
                     Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>RegScreen()));
                  }, 
                 child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center (child:Text(' SIGN UP',style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                   fontFamily: 'PlaywriteRO-Regular'
          
                   ),
                   ),),
                   ),
               ),
              
          
          ],
      

        ),
      ),

    );
  }
}
