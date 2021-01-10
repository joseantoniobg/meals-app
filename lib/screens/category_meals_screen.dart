import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal-item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

// CategoryMealsScreen(this.categoryId, this.categoryTitle);
class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadInitData = false;
  final ScrollController _scrollController = ScrollController();
  double padding = 0;

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      padding = displayedMeals.length >= 3 ? 5 : 0;
    }
    _loadInitData = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            right: displayedMeals.length >= 3 ? 10 : 0,
            top: padding,
            bottom: padding),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          thickness: 10,
          radius: Radius.circular(5),
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                removeItem: _removeMeal,
                rightPadding: displayedMeals.length < 3 ? 10 : 20,
              );
            },
            itemCount: displayedMeals.length,
          ),
        ),
      ),
    );
  }
}
