import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: categoryList
            .map((category) =>
                CategoryItem(category.id, category.title, category.color))
            .toList(),
      ),
    );
  }
}
