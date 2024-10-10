/*
 * MealDetailsScreen displays detailed information about a selected meal,
 * including its title, image, ingredients, and preparation steps. It also allows
 * the user to toggle the meal as a favorite.
 */
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

/*
 * MealDetailsScreen is a stateless widget that takes a Meal object as a required parameter,
 * along with a callback function onToggleFavorite for marking the meal as a favorite.
 */
class MealDetailsScreen extends StatelessWidget{
  const MealDetailsScreen({
    super.key, 
    required this.meal,
    required this.onToggleFavorite,
  });

  final Meal meal; // The meal object whose details are being displayed
  final void Function(Meal meal) onToggleFavorite; // Callback function for toggling the meal as a favorite

  /*
   * build creates the user interface for the meal details screen.
   * It includes the meal image, ingredients, and preparation steps.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            }, 
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text(
              'Ingredients', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14,),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              ),
            const SizedBox(height: 24,),
            Text(
              'Steps', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14,),
            for (final steps in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(
                steps,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            )
          ],
        ),
      ) 
    );
  }
}