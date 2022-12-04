import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widget/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final meals = DUMMY_MEALS
        .where((element) => element.categories.contains(routeArgs['id']))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']!),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealIteam(
              meals[index].imageUrl, meals[index].title, meals[index].duration);
        },
      ),
    );
  }
}
