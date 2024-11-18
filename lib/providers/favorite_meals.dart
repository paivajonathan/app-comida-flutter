import 'package:flutter/material.dart';
import 'package:projeto1/models/meal.dart';

class FavoriteMealsProvider extends ChangeNotifier {
  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  bool check(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  void favoriteOrUnfavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
