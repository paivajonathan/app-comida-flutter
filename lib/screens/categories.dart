import 'package:flutter/material.dart';
import 'package:projeto1/data/dummy_data.dart';
import 'package:projeto1/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories) 
            CategoryGridItem(
              category: category,
            )
        ],
      ),
    );
  }
}