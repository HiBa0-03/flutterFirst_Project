import 'package:flutter/material.dart';
//import 'package:hib_testflu/widgets/category_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:hib_testflu/data/ENcategory_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage_english extends StatefulWidget {
  final String language;
  final String level;
  const HomePage_english({super.key, required this.language, required this.level});

  @override
  State<HomePage_english> createState() => _HomePage_englishState();
}


class _HomePage_englishState extends State<HomePage_english> {
  int category_slider_index = -1;
  String userName = ""; 
void _navigateToVideos(String category) {
    Navigator.pushNamed(
      context,
      '/cours', 
      arguments: {
        'language': widget.language,
        'level': widget.level,       
        'category': category,       
      },
    );
  }

  @override
   void initState() {
    super.initState();
    _loadUserName(); 
  }
  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'User';   });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:const Color.fromARGB(255, 250, 250, 250),
     appBar: appBar(),
     body: ListView(
       physics: AlwaysScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 252, 172, 207),

                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
               ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                 child:Column(
                  children: [
                    searchBox(),
                    HeaderText("Categories"),
                    SizedBox( height: 5 ),
                    categorySlider(),
                   
                  ],
                ),

                ),
             
             
            )
          ],
        )
      ],
     ),




    );
  }


Container categorySlider() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.2, 
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              category_slider_index = index;
            });
            _navigateToVideos(categories[index].categoryTitle.toLowerCase());
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: category_slider_index == index 
                ?  Color.fromARGB(255, 236, 103, 161)
                : Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categories[index].categoryIcon,
                    size: 40,
                    color: category_slider_index == index 
                        ? Colors.white 
                        :  Color.fromARGB(255, 236, 103, 161),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categories[index].categoryTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: category_slider_index == index 
                          ? Colors.white 
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

//categories header text
  Row  HeaderText( String title ) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                     title,
                     style:   const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255),                         
                      ),
                      ),
                      TextButton(onPressed: (){}, child: Text('See all',style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 167, 167, 167),                     
                      ),
                      ),
                      ),
                    
                    ],
                  );
                    
  }
//search bar function
  TextField searchBox() {
    return TextField( 
                    style: const TextStyle(  fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 236, 103, 161),
 ),
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(245, 255, 200, 240),width:0,style:BorderStyle.none),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: const Color.fromARGB(245, 255, 255, 255),
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 252, 172, 207),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.search,color: Color.fromARGB(255, 245, 242, 244),),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Search for English courses',
                      hintStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold,color:Color.fromARGB(255, 252, 172, 207),),
                    ),
                  );
  }
//fonction of app bar 
  AppBar appBar() {
    return AppBar(
    backgroundColor: Color.fromARGB(255, 236, 103, 161) ,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child:SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello $userName, ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,letterSpacing: 3,color: Color.fromARGB(245, 255, 255, 255), fontSize: 22.0,
                      
                    ),
                  ),
                  Text("Start your ${widget.level} English journey today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.0,color:   Color.fromARGB(255, 252, 172, 207),
                        
                    ),
                  ),
                ],
              ),
            Stack(//search bar 
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(9),
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(245, 255, 200, 240),
                    boxShadow:[
                      BoxShadow(
                        color: Color.fromARGB(245, 255, 200, 240),
                        spreadRadius: 0.5,
                        blurStyle: BlurStyle.outer
                      )
                    ]
                  ),
                           child: IconButton(
                      icon: Icon(Icons.logout, size: 20, color:  Color.fromARGB(255, 236, 103, 161) ),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isLoggedIn', false);
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
}