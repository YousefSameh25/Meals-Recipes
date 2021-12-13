import 'package:flutter/material.dart';
import 'package:meal_app/favorites_data.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Favorites'),
          backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              url: favoriteMeals[index].imageUrl,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length,
        ),
        drawer: MainDrawer(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Favorites'),
          backgroundColor: Color.fromRGBO(0, 173, 181, 1),
        ),
        body: Center(
          child: Text(
            'There is no favorite meals.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        drawer: MainDrawer(),
      );
    }
  }
}
