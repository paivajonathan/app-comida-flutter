import 'package:flutter/material.dart';
import 'package:projeto1/data/dummy_data.dart';
import 'package:projeto1/models/category.dart';
import 'package:projeto1/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
    {
      super.key,
      required this.category,
    }
  );

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return MealsScreen(
              title: category.title,
              meals: dummyMeals.where((meal) => meal.categories.contains(category.id)).toList(),
            );
          }),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.25), category.color.withOpacity(0.75)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          )
        )
      ),
    );
  }
}