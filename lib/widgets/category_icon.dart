import 'package:flutter/cupertino.dart';
import 'package:hib_testflu/model/category.dart';
import 'package:flutter/material.dart';

class category_icon extends StatelessWidget {
   final Category category;
    final bool seleIndex;
   
  const category_icon({super.key,required this.category,this.seleIndex=false});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.symmetric(horizontal: 20),
    child: Column(
    children: [
      Container(
        height: 60,
        width:60 ,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 244, 65, 163),
              blurStyle: BlurStyle.outer,
             
            )
          ],
          color: seleIndex?  Color.fromARGB(255, 250, 250, 250):const Color.fromARGB(255, 252, 65, 183),
          shape: BoxShape.circle,
        ),
        child: Center(
       child: Icon(category.categoryIcon,
        color: seleIndex? Colors.pink:const Color.fromARGB(255, 69, 67, 67),
       ), 
        ),
      ),
    const SizedBox(height: 5,),
    Text(category.categoryTitle,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
     color: seleIndex? Colors.pink:const Color.fromARGB(255, 69, 67, 67),

    )
    )
    ],
    ),
    
    );
  }
}