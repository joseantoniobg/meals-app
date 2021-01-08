import 'package:flutter/material.dart';
import './dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
