import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];

    super.initState();
  }

  Widget _buildFilterOption(
      String title, String subtitle, bool value, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Ajust your Meal Selectiob',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildFilterOption(
                      'Gluten-Free',
                      'Only includes Gluten-free meals',
                      _glutenFree, (newvalue) {
                    setState(() {
                      _glutenFree = newvalue;
                    });
                  }),
                  _buildFilterOption(
                      'Lactose-Free',
                      'Only includes Lactose-free meals',
                      _lactoseFree, (newvalue) {
                    setState(() {
                      _lactoseFree = newvalue;
                    });
                  }),
                  _buildFilterOption(
                      'Vegetarian Food',
                      'Only includes Vegeratian meals',
                      _vegetarian, (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }),
                  _buildFilterOption(
                      'Vegan Food', 'Only includes Vegan meals', _vegan,
                      (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
