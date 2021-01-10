import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal-item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  final ScrollController _scrollController = ScrollController();

  FavoritesScreen(this.favoritedMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoritedMeals.length == 0
          ? Center(
              child: Text('You don\'t have favorites yet. Try adding some!'),
            )
          : Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              thickness: 10,
              radius: Radius.circular(5),
              child: ListView.builder(
                controller: _scrollController,
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: favoritedMeals[index].id,
                    title: favoritedMeals[index].title,
                    imageUrl: favoritedMeals[index].imageUrl,
                    duration: favoritedMeals[index].duration,
                    affordability: favoritedMeals[index].affordability,
                    complexity: favoritedMeals[index].complexity,
                    removeItem: () {},
                    rightPadding: favoritedMeals.length < 3 ? 10 : 20,
                  );
                },
                itemCount: favoritedMeals.length,
              ),
            ),
    );
  }
}
