import 'package:flutter/material.dart';
import 'package:projeto1/models/meal.dart';
import 'package:projeto1/providers/favorite_meals.dart';
import 'package:projeto1/widgets/meal_item_trait.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.meal,
  });

  final Meal meal;

  String _getTitle(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMealProvider = Provider.of<FavoriteMealsProvider>(context);

    final additionalInfo = [
      if (meal.isGlutenFree)
        const ListTile(
          leading: Icon(Icons.crop_din),
          title: Text("Gluten Free"),
        ),
      if (meal.isLactoseFree)
        const ListTile(
          leading: Icon(Icons.crop_din),
          title: Text("Lactose Free"),
        ),
      if (meal.isVegan)
        const ListTile(
          leading: Icon(Icons.crop_din),
          title: Text("Vegan"),
        ),
      if (meal.isVegetarian)
        const ListTile(
          leading: Icon(Icons.crop_din),
          title: Text("Vegetarian"),
        ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 50),
            child: IconButton(
              icon: favoriteMealProvider.check(meal)
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border),
              onPressed: () {
                favoriteMealProvider.favoriteOrUnfavorite(meal);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MealItemTrait(
                  label: "${meal.duration.toString()} min",
                  icon: Icons.schedule,
                ),
                MealItemTrait(
                  label: _getTitle(meal.complexity.name),
                  icon: Icons.work,
                ),
                MealItemTrait(
                  label: _getTitle(meal.affordability.name),
                  icon: Icons.attach_money,
                ),
              ],
            ),
            const SizedBox(height: 10),

            if (additionalInfo.isNotEmpty)
              Column(
                children: [
                  const Title(content: "Additional Info"),
                  ...additionalInfo,
                ],
              ),

            const Title(content: "Ingredients"),            
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.crop_din),
                  title: Text(meal.ingredients[index]),
                );
              }
            ),
            
            const Title(content: "Steps"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.crop_din),
                  title: Text(meal.steps[index]),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          content,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ), 
        const SizedBox(height: 10),
      ]
    );
  }
}
