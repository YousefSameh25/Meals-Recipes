import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/favorites_data.dart';
import 'package:meal_app/models/meal.dart';

Meal selectedMeal;

class MealDetailScreen extends StatefulWidget {
  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(212, 236, 221, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(52, 91, 99, 1),
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:
                  Text('Ingredients', style: Theme.of(context).textTheme.title),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Color.fromRGBO(60, 165, 157, 0.4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('Steps', style: Theme.of(context).textTheme.title),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Color.fromRGBO(60, 165, 157, 1),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(52, 91, 99, 1),
        onPressed: () {
          setState(() {
            toggleFavorite(selectedMeal.id);
          });
        },
        child: Icon(
          isMealFavorite(selectedMeal.id) ? Icons.star : Icons.star_border,
          color: Color.fromRGBO(212, 236, 221, 1),
        ),
      ),
    );
  }
}

selectmeal(String mealId) {
  for (int i = 0; i < DUMMY_MEALS.length; i++) {
    if (DUMMY_MEALS[i].id == mealId) {
      selectedMeal = DUMMY_MEALS[i];
      break;
    }
  }
}
