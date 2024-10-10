import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';

class RandomMealScreen extends StatelessWidget {
  const RandomMealScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  final List<Meal> meal;
  final void Function(Meal meal) onToggleFavorite;

  
  @override
  Widget build(BuildContext context) {
    return MealsScreen(
        title: 'Random Meal',
        meals: meal,
        onToggleFavorite: onToggleFavorite,
      );
  }
}
