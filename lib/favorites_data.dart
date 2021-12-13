import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

List<Meal> favoriteMeals = [];
bool isMealFavorite(String id) {
  return favoriteMeals.any((meal) => meal.id == id);
}

void toggleFavorite(String mealId) {
  final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
  if (existingIndex >= 0) {
    favoriteMeals.removeAt(existingIndex);
  } else {
    favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
  }
}
