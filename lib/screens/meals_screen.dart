import 'package:flutter/material.dart';
import 'package:meal_app/filters_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

List<Meal> selectedMeals = [];
void selectmeals(id) {
  selectedMeals.clear();
  for (int i = 0; i < availableMeals.length; i++) {
    if (availableMeals[i].categories.contains(id)) {
      selectedMeals.add(availableMeals[i]);
    }
  }
}

class MealsScreen extends StatefulWidget {
  final String title;
  final String id;
  MealsScreen({@required this.id, @required this.title});

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  void removeMeal(String mealId) {
    setState(() {
      availableMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(170, 216, 211, 1),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 173, 181, 1),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: selectedMeals[index].id,
            title: selectedMeals[index].title,
            duration: selectedMeals[index].duration,
            complexity: selectedMeals[index].complexity,
            url: selectedMeals[index].imageUrl,
            affordability: selectedMeals[index].affordability,
          );
        },
        itemCount: selectedMeals.length,
      ),
    );
  }
}
