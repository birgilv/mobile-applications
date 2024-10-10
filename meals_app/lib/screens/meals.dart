/*
 * MealsScreen displays a list of meals for a selected category. It allows users
 * to view meal details and navigate to the MealDetailsScreen. If no meals are 
 * available, it shows a message prompting users to select a different category.
 */
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

/*
 * MealsScreen is a stateless widget that shows a list of meals for a category.
 * It accepts an optional title, a list of meals, and a callback function
 * onToggleFavorite for toggling the meal as a favorite.
 */
class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title; // Optional title of the category for the app bar
  final List<Meal> meals; // List of meals to display
  final void Function(Meal meal) onToggleFavorite; // Callback to toggle favorite status of a meal

  /*
   * selectMeal navigates to the MealDetailsScreen when a meal is selected.
   * It passes the selected meal and the onToggleFavorite callback to the detail screen.
   */
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  /*
   * build creates the user interface for displaying a list of meals.
   * It shows a placeholder message if no meals are available.
   */
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}