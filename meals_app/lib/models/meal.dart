/*
 * The Complexity enum defines the difficulty level for meal preparation.
 * - simple: Easy to prepare
 * - challenging: Medium difficulty
 * - hard: Difficult to prepare
 */
enum Complexity {
  simple,
  challenging,
  hard,
}

/*
 * The Affordability enum defines the price range of the meal.
 * - affordable: Low cost
 * - pricey: Medium cost
 * - luxurious: High cost
 */
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

/*
 * The Meal class represents a meal in the app. 
 * Each meal contains:
 * - A unique ID (id)
 * - A list of category IDs it belongs to (categories)
 * - A title (title)
 * - An image URL for visual representation (imageUrl)
 * - A list of ingredients (ingredients)
 * - A list of preparation steps (steps)
 * - The time it takes to prepare (duration)
 * - The meal's complexity level (complexity)
 * - The meal's affordability level (affordability)
 * - Dietary restrictions: 
 *   - isGlutenFree: Whether it's gluten-free
 *   - isLactoseFree: Whether it's lactose-free
 *   - isVegan: Whether it's vegan
 *   - isVegetarian: Whether it's vegetarian
 */
class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}