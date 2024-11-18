
import 'package:flutter/material.dart';

class MealFiltersProvider extends ChangeNotifier {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  bool get isGlutenFree => _isGlutenFree;
  bool get isLactoseFree => _isLactoseFree;
  bool get isVegetarian => _isVegetarian;
  bool get isVegan => _isVegan;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }
  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }
  set isVegetarian(bool value) {
    _isVegetarian = value;
    notifyListeners();
  }
  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }
}
