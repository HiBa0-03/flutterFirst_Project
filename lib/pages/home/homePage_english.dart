import 'package:flutter/material.dart';
import 'package:hib_testflu/widgets/category_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:hib_testflu/data/ENcategory_data.dart';
class HomePage_english extends StatefulWidget {
  const HomePage_english({super.key});

  @override
  State<HomePage_english> createState() => _HomePage_englishState();
}

class _HomePage_englishState extends State<HomePage_english> {
  int category_slider_index = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:const Color.fromARGB(255, 250, 250, 250),
     appBar: appBar(),
     body: ListView(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color:  Color.fromARGB(245, 255, 200, 240),
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
                    categorySlider()
          
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
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context ,int index){
                     return GestureDetector(
                        onTap: (){
                          setState(() {
                            category_slider_index = index;
                          });
                         // Navigator.pushNamed(context, '/cours');
                        },
                        child:category_icon(category: categories[index],seleIndex: category_slider_index == index),
        );
        }
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
                        fontSize: 14, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 86, 92, 99),                         
                      ),
                      ),
                      ),
                    
                    ],
                  );
                    
  }
//search bar function
  TextField searchBox() {
    return TextField(
                    style: const TextStyle(  fontWeight: FontWeight.bold,color:   Color.fromARGB(255, 244, 65, 163), ),
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
                          color: const Color.fromARGB(245, 255, 200, 240),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.search,color: Color.fromARGB(255, 245, 242, 244),),
                      ),
                      contentPadding: const EdgeInsets.all(15),
                      hintText: 'Search for English courses',
                      hintStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold,color: Color.fromARGB(245, 255, 200, 240),),
                    ),
                  );
  }
//fonction of app bar 
  AppBar appBar() {
    return AppBar(
    backgroundColor: const Color.fromARGB(255, 244, 65, 163),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child:SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Hiba, ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,letterSpacing: 3,color: Color.fromARGB(245, 255, 255, 255), fontSize: 22.0,
                      
                    ),
                  ),
                  Text("Start your English journey today",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.0,color: Color.fromARGB(245, 255, 200, 240),
                    ),
                  ),
                ],
              ),
            Stack(//search bar 
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.all(4),
                  decoration:const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(245, 255, 200, 240),
                    boxShadow:[
                      BoxShadow(
                        color: Color.fromARGB(245, 255, 200, 240),
                        spreadRadius: 2,
                        blurStyle: BlurStyle.outer
                      )
                    ]
                  ),
                  child: const  Icon(Icons.search,size: 26,color: Colors.white,),
                ),
               
              ],
            )
            ],
          ),
          ),
      ) ,
      ),
   );
  }
}