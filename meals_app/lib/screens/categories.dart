/*
 * CategoriesScreen displays a grid of meal categories. 
 * It allows the user to select a category, which filters meals by that category 
 * and navigates to a screen showing the filtered meals.
 */

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

/*
 * CategoriesScreen is a stateless widget that shows available meal categories.
 * It requires two parameters:
 * - onToggleFavorite: A callback to handle favoriting/unfavoriting meals.
 * - availableMeals: A list of meals available for display and filtering.
 */
class CategoriesScreen extends StatelessWidget {
const CategoriesScreen ({
  super.key,
  required this.onToggleFavorite,
  required this.availableMeals,
});


final void Function(Meal meal) onToggleFavorite; // Callback for toggling meal favorites
final List<Meal> availableMeals;  // List of available meals

/*
 * _selectCategory filters the available meals based on the selected category
 * and navigates to the MealsScreen, displaying meals from the selected category.
 */
void _selectCategory(BuildContext context, Category category) {
  final filteredMeals = availableMeals
      .where((meal) => meal.categories.contains(category.id)
      ).toList();

  //Navigator.push(context, route);
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
      ),
    )
  );
}

  /*
   * build creates the UI for the categories screen, displaying all the categories.
   */
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
        CategoryGridItem(
          category: category, 
          onSelectCategory: () {
            _selectCategory(context, category);
          },
        ),
      ],
    );
  }
}