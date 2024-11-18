import 'package:flutter/material.dart';
import 'package:projeto1/providers/meal_filters.dart';
import 'package:projeto1/screens/tabs.dart';
import 'package:projeto1/widgets/filter_switch_tile.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  void _selectDrawerScreen(String identifier) {
    if (identifier == "categories") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealFiltersProvider = Provider.of<MealFiltersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(onSelectedScreen: _selectDrawerScreen),
      body: Column(
        children: [
          FilterSwitchTile(
            value: mealFiltersProvider.isGlutenFree,
            onChanged: (isChecked) {
              setState(() => mealFiltersProvider.isGlutenFree = isChecked);
            },
            title: "Gluten Free",
            subtitle: "Only include gluten free meals.",
          ),
          FilterSwitchTile(
            value: mealFiltersProvider.isLactoseFree,
            onChanged: (isChecked) {
              setState(() => mealFiltersProvider.isLactoseFree = isChecked);
            },
            title: "Lactose Free",
            subtitle: "Only include lactose free meals.",
          ),
          FilterSwitchTile(
            value: mealFiltersProvider.isVegetarian,
            onChanged: (isChecked) {
              setState(() => mealFiltersProvider.isVegetarian = isChecked);
            },
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals.",
          ),
          FilterSwitchTile(
            value: mealFiltersProvider.isVegan,
            onChanged: (isChecked) {
              setState(() => mealFiltersProvider.isVegan = isChecked);
            },
            title: "Vegan",
            subtitle: "Only include vegan meals.",
          ),
        ],
      ),
    );
  }
}
