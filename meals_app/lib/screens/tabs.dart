/*
 * TabsScreen provides the main navigation between the "Categories" and "Favorites" screens.
 * It uses a bottom navigation bar for switching between tabs and manages the filtering of meals 
 * and handling of favorite meals.
 */

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/screens/random_meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

/*
 * Initial filter values to filter meals
 */
const kInitialFilters = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

/*
 * TabsScreen is a StatefulWidget that manages two main tabs: 
 * CategoriesScreen and MealsScreen for displaying favorite meals.
 */
class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
  
}

/*
 * _TabsScreenState manages the selected tab, favorite meals, and filtered meals.
 * It also handles navigation to the FiltersScreen and RandomMealScreen.
 */
class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter,bool> _selectedFilters = kInitialFilters;

  // Shows a message using SnackBar
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // Toggles the favorite status of a meal
  void _toggleFavoriteMealStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is removed from favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Meal is added to favorites');
    }
  }

  // Updates the selected tab index
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Handles navigation to the FiltersScreen or RandomMealScreen
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters)
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    } else if (identifier == 'random') {
    final random = Random();
    final List<Meal> randomMeal = [];
    randomMeal.add(dummyMeals[random.nextInt(dummyMeals.length)]);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RandomMealScreen(
          meal: randomMeal,
          onToggleFavorite: _toggleFavoriteMealStatus,
        ),
      ),
    );
    }
  }

  
  /*
   * The build method creates the main UI, showing either the CategoriesScreen
   * or the MealsScreen with favorite meals, based on the selected tab.
   * It filters meals based on the selected filters and handles the navigation drawer.
   */
  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteMealStatus,
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1){
      activePage =  MealsScreen(
        meals: _favoriteMeals, 
        onToggleFavorite: _toggleFavoriteMealStatus,
      );
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(ofSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
