import 'dart:core';
import 'package:flutter/foundation.dart';
// 1
import 'repository.dart';
// 2
import 'models/models.dart';

class MemoryRepository extends Repository with ChangeNotifier {
  // Initialize your current list of recipes.
  final List<Recipe> _currentRecipes = <Recipe>[];
  final List<Ingredient> _currentIngredients = <Ingredient>[];

  @override
  Future init() {
    return Future.value(null);
  }

  @override
  void close() {}

  @override
  void deleteIngredient(Ingredient ingredient) {
    _currentIngredients.remove(ingredient);
  }

  @override
  void deleteIngredients(List<Ingredient> ingredients) {
    _currentIngredients.removeWhere((element) => ingredients.contains(element));
    notifyListeners();
  }

  @override
  void deleteRecipe(Recipe recipe) {
    _currentRecipes.remove(recipe);
    if (recipe.id != null) {
      deleteRecipeIngredients(recipe.id!);
    }
    // Notify all listeners of the changes.
    notifyListeners();
  }

  @override
  void deleteRecipeIngredients(int recipeId) {
    _currentIngredients
        .removeWhere((ingredient) => ingredient.recipeId == recipeId);
    notifyListeners();
  }

  @override
  List<Ingredient> findAllIngredients() {
    return _currentIngredients;
  }

  @override
  List<Recipe> findAllRecipes() {
    return _currentRecipes;
  }

  @override
  Recipe findRecipeById(int id) {
    return _currentRecipes.firstWhere((element) => element.id == id);
  }

  @override
  List<Ingredient> findRecipeIngredients(int recipeId) {
    final recipe =
        _currentRecipes.firstWhere((element) => element.id == recipeId);
    final recipeIngredients = _currentIngredients
        .where((element) => element.recipeId == recipe.id)
        .toList();
    return recipeIngredients;
  }

  @override
  List<int> insertIngredients(List<Ingredient> ingredients) {
    // 16
    if (ingredients.isNotEmpty) {
      // 17
      _currentIngredients.addAll(ingredients);
      // 18
      notifyListeners();
    }
    // 19
    return <int>[];
  }

  @override
  int insertRecipe(Recipe recipe) {
    _currentRecipes.add(recipe);
    if (recipe.ingredients != null) {
      insertIngredients(recipe.ingredients!);
    }
    // Notify all listeners of the changes.
    notifyListeners();
    return 0;
  }
}
