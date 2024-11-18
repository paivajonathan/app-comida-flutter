import 'package:flutter/material.dart';
import 'package:projeto1/providers/favorite_meals.dart';
import 'package:projeto1/screens/categories.dart';
import 'package:projeto1/screens/filters.dart';
import 'package:projeto1/screens/meals.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

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
          builder: (context) => const FiltersScreen(),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMealsProvider = Provider.of<FavoriteMealsProvider>(context);

    Widget activeScreen = const CategoriesScreen();
    String activeScreenTitle = "Categories";

    if (_selectedScreenIndex == 1) {
      activeScreen = MealsScreen(meals: favoriteMealsProvider.favoriteMeals);
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
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}