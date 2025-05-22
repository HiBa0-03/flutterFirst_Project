import '../model/category.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
List<Category> categories = [
  Category(
    categoryTitle: 'Vocabulary',
    categoryIcon: IconlyLight.document ,
  ),
  const Category(
    categoryTitle: 'Grammar',
    categoryIcon: IconlyLight.work,
  ),
  const Category(
    categoryTitle: 'common \n expression',
    categoryIcon:  IconlyLight.chat ,
  ),
   const Category(
    categoryTitle:'quiz',
    categoryIcon:  IconlyLight.game ,
  ),
];
