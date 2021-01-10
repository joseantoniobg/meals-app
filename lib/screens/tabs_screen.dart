import 'package:flutter/material.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;

  TabsScreen(this.favoritedMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> favMeals = [];
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
        'overTitle': 'DeliMeals!'
      },
      {
        'page': FavoritesScreen(favMeals),
        'title': 'Favorites',
        'overTitle': 'Your Favorites'
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['overTitle']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: _pages[_selectedPageIndex]['title'],
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: _pages[_selectedPageIndex]['title'],
          ),
        ],
      ),
    );

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals!'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoritesScreen(favMeals)],
        ),
      ),
    );
  }
}
