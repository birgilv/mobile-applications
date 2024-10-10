/*
 * RandomMealScreen displays a randomly selected meal using the MealsScreen widget.
 * It accepts a list containing the random meal and a callback function for toggling
 * the meal as a favorite.
 */
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';

/*
 * RandomMealScreen is a stateless widget that wraps the MealsScreen. 
 * It displays a random meal with the title "Random Meal" and passes the meal 
 * and onToggleFavorite callback to the MealsScreen widget.
 */
class RandomMealScreen extends StatelessWidget {
  const RandomMealScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final List<Meal> meal; // Randomly selected meal to display
  final void Function(Meal meal) onToggleFavorite;  // Callback to toggle favorite status

  /*
   * build creates the user interface for displaying the random meal by reusing
   * the MealsScreen widget. It sets the title to "Random Meal" and passes the
   * meal and onToggleFavorite callback.
   */
  @override
  Widget build(BuildContext context) {
    return MealsScreen(
        title: 'Random Meal',
        meals: meal,
        onToggleFavorite: onToggleFavorite,
      );
  }
}
