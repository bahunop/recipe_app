import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesHelper {
  Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recipes = prefs.getStringList('recipes') ?? [];
    recipes.add(jsonEncode(recipe));
    await prefs.setStringList('recipes', recipes);
  }

  Future<void> deleteRecipe(String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recipes = prefs.getStringList('recipes') ?? [];
    recipes.removeWhere((recipe) => jsonDecode(recipe)['name'] == name);
    await prefs.setStringList('recipes', recipes);
  }

  Future<List<String>> getRecipes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('recipes') ?? [];
  }
}
