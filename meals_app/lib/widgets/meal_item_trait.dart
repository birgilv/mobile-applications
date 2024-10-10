import 'package:flutter/material.dart';

/*
 * MealItemTrait is a widget that displays an icon and a label, typically used to represent
 * a trait or characteristic of a meal (e.g., duration, complexity, or affordability).
 */
class MealItemTrait extends StatelessWidget{
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon; // IconData to represent the trait, such as cooking duration or difficulty.
  final String label; // Label describing the trait, like '30 mins' or 'Simple'.

  /*
   * The build method returns a Row that contains an icon and a label,
   * both styled with a white color to match the meal item theme.
   */
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon, 
          size: 17, 
          color: Colors.white
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}