import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final ScrollController _mainScrollControler = ScrollController();
  final ScrollController _ingredientsScrollControler = ScrollController();
  final ScrollController _stepsScrollControler = ScrollController();

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;

    Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _mainScrollControler,
          child: SingleChildScrollView(
            controller: _mainScrollControler,
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                buildSectionTitle(context, 'Ingredients'),
                buildContainer(
                  Scrollbar(
                    isAlwaysShown: true,
                    controller: _ingredientsScrollControler,
                    child: ListView.builder(
                        controller: _ingredientsScrollControler,
                        itemBuilder: (ctx, index) => Card(
                              color: Theme.of(context).accentColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                child: Text(meal.ingredients[index]),
                              ),
                            ),
                        itemCount: meal.ingredients.length),
                  ),
                ),
                buildSectionTitle(context, 'Steps'),
                buildContainer(
                  Scrollbar(
                    isAlwaysShown: true,
                    controller: _stepsScrollControler,
                    child: ListView.builder(
                        controller: _stepsScrollControler,
                        itemBuilder: (ctx, index) => Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    child: Text('# ${(index + 1)}'),
                                  ),
                                  title: Text(meal.steps[index]),
                                ),
                                Divider()
                              ],
                            ),
                        itemCount: meal.steps.length),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
