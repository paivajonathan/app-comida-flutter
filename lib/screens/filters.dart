import 'package:flutter/material.dart';
import 'package:projeto1/models/meal.dart';
import 'package:projeto1/screens/tabs.dart';
import 'package:projeto1/widgets/filter_switch_tile.dart';
import 'package:projeto1/widgets/main_drawer/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.mealFilters,
    required this.favoriteMeals,
  });

  final Map<String, bool> mealFilters;
  final List<Meal> favoriteMeals;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  void _selectDrawerScreen(String identifier) {
    if (identifier == "categories") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => TabsScreen(
            mealFilters: widget.mealFilters,
            favoriteMeals: widget.favoriteMeals,
          ),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(onSelectedScreen: _selectDrawerScreen),
      body: Column(
        children: [
          FilterSwitchTile(
            value: widget.mealFilters["isGlutenFree"] ?? false,
            onChanged: (isChecked) {
              setState(() => widget.mealFilters["isGlutenFree"] = isChecked);
            },
            title: "Gluten Free",
            subtitle: "Only include gluten free meals.",
          ),
          FilterSwitchTile(
            value: widget.mealFilters["isLactoseFree"] ?? false,
            onChanged: (isChecked) {
              setState(() => widget.mealFilters["isLactoseFree"] = isChecked);
            },
            title: "Lactose Free",
            subtitle: "Only include lactose free meals.",
          ),
          FilterSwitchTile(
            value: widget.mealFilters["isVegetarian"]  ?? false,
            onChanged: (isChecked) {
              setState(() => widget.mealFilters["isVegetarian"] = isChecked);
            },
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals.",
          ),
          FilterSwitchTile(
            value: widget.mealFilters["isVegan"] ?? false,
            onChanged: (isChecked) {
              setState(() => widget.mealFilters["isVegan"] = isChecked);
            },
            title: "Vegan",
            subtitle: "Only include vegan meals.",
          ),
        ],
      ),
    );
  }
}
