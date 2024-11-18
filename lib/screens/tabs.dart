import 'package:flutter/material.dart';
import 'package:projeto1/models/meal.dart';
import 'package:projeto1/screens/categories.dart';
import 'package:projeto1/screens/filters.dart';
import 'package:projeto1/screens/meals.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
    required this.mealFilters,
    required this.favoriteMeals,
  });

  final Map<String, bool> mealFilters;
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() => _selectedScreenIndex = index);
  }

  void _selectDrawerScreen(String identifier) {
    if (identifier == "filters") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(
            mealFilters: widget.mealFilters,
            favoriteMeals: widget.favoriteMeals,
          ),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    if (widget.favoriteMeals.contains(meal)) {
      setState(() => widget.favoriteMeals.remove(meal));
      _showInfoMessage("Meal removed from favorites.");
    } else {
      setState(() => widget.favoriteMeals.add(meal));
      _showInfoMessage("Meal added to favorites.");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      mealFilters: widget.mealFilters,
    );
    String activeScreenTitle = "Categories";

    if (_selectedScreenIndex == 1) {
      activeScreen = MealsScreen(
        meals: widget.favoriteMeals,
        mealFilters: widget.mealFilters,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activeScreenTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle)
      ),
      drawer: MainDrawer(onSelectedScreen: _selectDrawerScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}