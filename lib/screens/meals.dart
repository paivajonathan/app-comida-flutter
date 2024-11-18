import 'package:flutter/material.dart';
import 'package:projeto1/models/meal.dart';
import 'package:projeto1/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
    {
      super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite,
      required this.mealFilters,
    }
  );

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  final Map<String, bool> mealFilters;

  @override
  Widget build(BuildContext context) {
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
          bool isGlutenFree  = mealFilters["isGlutenFree"]  ?? false;
          bool isLactoseFree = mealFilters["isLactoseFree"] ?? false;
          bool isVegan       = mealFilters["isVegan"]       ?? false;
          bool isVegetarian  = mealFilters["isVegetarian"]  ?? false;

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
              onToggleFavorite: onToggleFavorite,
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