import 'package:flutter/material.dart';
import 'package:projeto1/models/meal.dart';
import 'package:projeto1/providers/meal_filters.dart';
import 'package:projeto1/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
    {
      super.key,
      this.title,
      required this.meals,
    }
  );

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final mealFiltersProvider = Provider.of<MealFiltersProvider>(context);

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nothing to show!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            )
          ),
          const SizedBox(height: 16),
          Text(
            "Try selecting a different category.",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            )
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      List<Meal> filteredMeals = meals.where(
        (meal) {
          bool isGlutenFree  = mealFiltersProvider.isGlutenFree;
          bool isLactoseFree = mealFiltersProvider.isLactoseFree;
          bool isVegan       = mealFiltersProvider.isVegan;
          bool isVegetarian  = mealFiltersProvider.isVegetarian;

          if (isGlutenFree  && !meal.isGlutenFree)  return false;
          if (isLactoseFree && !meal.isLactoseFree) return false;
          if (isVegan       && !meal.isVegan)       return false;
          if (isVegetarian  && !meal.isVegetarian)  return false;
          
          return true;
        }
      ).toList();

      if (filteredMeals.isNotEmpty) {
        content = ListView.builder(
          itemCount: filteredMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              meal: filteredMeals[index],
            );
          }
        );
      }
    }

    if (title == null) {
      return content;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}