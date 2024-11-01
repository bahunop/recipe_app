// import 'dart:convert'; // To convert objects to JSON
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesHelper {
//   // Save a single recipe
//   Future<void> saveRecipe(Map<String, dynamic> recipe) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> recipes = prefs.getStringList('recipes') ?? [];

//     // Convert the recipe to JSON and add it to the list
//     recipes.add(jsonEncode(recipe));
//     await prefs.setStringList('recipes', recipes);
//   }

//   // Delete a recipe by name
//   Future<void> deleteRecipe(String name) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> recipes = prefs.getStringList('recipes') ?? [];

//     // Filter out the recipe with the specified name
//     recipes.removeWhere((item) {
//       Map<String, dynamic> recipe = jsonDecode(item);
//       return recipe['name'] == name;
//     });

//     await prefs.setStringList('recipes', recipes);
//   }

//   // Fetch all recipes
//   Future<List<Map<String, dynamic>>> getRecipes() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> recipes = prefs.getStringList('recipes') ?? [];

//     // Convert each JSON string back into a map
//     return recipes
//         .map((item) => jsonDecode(item) as Map<String, dynamic>)
//         .toList();
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesHelper {
  Future<void> saveRecipe(Map<String, dynamic> recipe) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recipes = prefs.getStringList('recipes') ?? [];
    recipes.add(jsonEncode(recipe)); // Save the entire recipe as JSON
    await prefs.setStringList('recipes', recipes);
  }

  Future<void> deleteRecipe(String name) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> recipes = prefs.getStringList('recipes') ?? [];
    recipes.removeWhere((recipe) =>
        jsonDecode(recipe)['name'] == name); // Find and remove by name
    await prefs.setStringList('recipes', recipes);
  }

  Future<List<String>> getRecipes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('recipes') ??
        []; // Return the list of saved recipes
  }
}
