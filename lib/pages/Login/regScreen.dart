import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();
final TextEditingController confirmController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 236, 103, 161),
                  Color.fromARGB(255, 252, 172, 207),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create Your\nAccount',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                 controller: nameController,
                   decoration: InputDecoration(
                   suffixIcon: Icon(Icons.check, color: Colors.grey),
                    label: Text('Full Name',
                     style: TextStyle(
                   fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 103, 161),
      ),
    ),
  ),
),

                     TextField(
  controller: emailController,
  decoration: const InputDecoration(
    suffixIcon: Icon(Icons.check, color: Colors.grey),
    label: Text(
      'Gmail',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 236, 103, 161),
      ),
    ),
  ),
),

                     TextField(
  controller: passController,
  obscureText: true,
  decoration: const InputDecoration(
    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
    label: Text(
      'Password',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 236, 103, 161),
      ),
    ),
  ),
),

                     TextField(
  controller: confirmController,
  obscureText: true,
  decoration: const InputDecoration(
    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
    label: Text(
      'Confirm Password',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 236, 103, 161),
      ),
    ),
  ),
),


                      const SizedBox(height: 10,),
                      const SizedBox(height: 70,),
                  GestureDetector(
  onTap: () async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        confirmController.text.isNotEmpty) {
      await saveUserData();
      Navigator.pushReplacementNamed(context, '/language'); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("S'il te plaît! Remplis tous les champs"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  },
  child: Container( 
    height: 55,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 236, 103, 161),
          Color.fromARGB(255, 252, 172, 207),
        ],
      ),
    ),
    child: const Center(
      child: Text(
        'SIGN IN',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  ),
),

                      const SizedBox(height: 80,),
                     
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
  Future<void> saveUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', nameController.text);
  await prefs.setString('email', emailController.text);
  await prefs.setBool('isLoggedIn', true);
}
}

