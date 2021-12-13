import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

Map<String, bool> filters =
 {
  'gluten': false,
  'lactose': false,
  'vegan': false,
  'vegetarian': false,
};
List<Meal> availableMeals = DUMMY_MEALS;

void setFiltes(Map<String, bool> filtesData)
 {
  filters = filtesData;
  availableMeals = DUMMY_MEALS.where((meal) {
    if (filters['gluten'] == true && meal.isGlutenFree == false) return false;
    if (filters['lactos'] == true && meal.isLactoseFree == false) return false;
    if (filters['vegan'] == true && meal.isVegan == false) return false;
    if (filters['vegetarian'] == true && meal.isVegetarian == false)
      return false;
    return true;
  }).toList();
}
