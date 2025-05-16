import '../model/category.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
List<Category> categories = [
  Category(
    categoryTitle: 'Vocabulaire',
    categoryIcon: IconlyLight.document ,
  ),
  const Category(
    categoryTitle: 'Grammaire',
    categoryIcon: IconlyLight.work,
  ),
  const Category(
    categoryTitle:'expression\n courante',
    categoryIcon:  IconlyLight.chat ,
  ),
];
