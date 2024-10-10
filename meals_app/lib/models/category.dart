import 'package:flutter/material.dart';

/*
 * The Category class represents a meal category in the app. 
 * Each category has:
 * - A unique ID (id)
 * - A title (title)
 * - An optional color (color), with a default value of orange
 */
class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}