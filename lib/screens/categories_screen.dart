import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal!'),
      ),
      body:*/
        Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: GridView(
        controller: _scrollController,
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(e.id, e.title, e.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
    //);
  }
}
