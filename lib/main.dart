import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto1/providers/favorite_meals.dart';
import 'package:projeto1/providers/meal_filters.dart';
import 'package:projeto1/providers/theme.dart';
import 'package:projeto1/screens/tabs.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteMealsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MealFiltersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, child) {
        final themeProvider = context.watch<ThemeProvider>();

        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.latoTextTheme(),
            colorScheme: ColorScheme.fromSeed(
              brightness: themeProvider.isDarkMode
                ? Brightness.dark
                : Brightness.light,
              seedColor: const Color.fromARGB(255, 131, 57, 0),
            ),
          ),
          home: const TabsScreen(),
        );
      },
    );
  }
}
