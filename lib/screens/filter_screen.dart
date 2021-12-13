import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/filters_data.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  void initState() {
    glutenFree = filters['gluten'];
    lactoseFree = filters['lactose'];
    vegan = filters['vegan'];
    vegetarian = filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() 
              {
                final selectedFilters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                setFiltes(selectedFilters);
              });
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Color.fromRGBO(0, 173, 181, 1),
                  title: Text('Gluten-free'),
                  value: glutenFree,
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (newValue) 
                  {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Color.fromRGBO(0, 173, 181, 1),
                  title: Text('Lactose-free'),
                  value: lactoseFree,
                  subtitle: Text('Only include lactose-free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Color.fromRGBO(0, 173, 181, 1),
                  title: Text('Vegan'),
                  value: vegan,
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Color.fromRGBO(0, 173, 181, 1),
                  title: Text('Vegetarian'),
                  value: vegetarian,
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
