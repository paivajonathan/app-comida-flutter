import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto1/models/meal.dart';
import 'package:projeto1/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, bool> mealFilters = {
      "isGlutenFree": false,
      "isLactoseFree": false,
      "isVegetarian": false,
      "isVegan": false,
    };

    List<Meal> favoriteMeals = [];

    return TabsScreen(mealFilters: mealFilters, favoriteMeals: favoriteMeals);
  }
}