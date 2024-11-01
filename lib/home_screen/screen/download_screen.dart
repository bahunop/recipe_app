import 'package:flutter/material.dart';
import 'package:recipe_app/core/database/database.dart';
import 'dart:convert';

import 'package:recipe_app/detail_page/screen/detail_screen.dart';
import 'package:recipe_app/home_screen/widgets/recipecard.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();
  List<Map<String, dynamic>> _downloadedRecipes = [];

  @override
  void initState() {
    super.initState();
    _fetchDownloadedRecipes();
  }

  Future<void> _fetchDownloadedRecipes() async {
    List<String> recipes = await _sharedPreferencesHelper.getRecipes();
    setState(() {
      _downloadedRecipes = recipes
          .map((recipe) => jsonDecode(recipe) as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloaded Recipes'),
      ),
      body: _downloadedRecipes.isEmpty
          ? const Center(child: Text('No downloaded recipes found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _downloadedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _downloadedRecipes[index];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              opacity: 0.2,
                              image: NetworkImage(recipe['picture']),
                              fit: BoxFit.cover)),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        detailrecipe: RecipeCard(
                                          name: recipe['name'],
                                          description: recipe['description'],
                                          time: recipe['time'],
                                          picture: recipe['picture'],
                                        ),
                                      )));
                        },
                        title: Text(recipe['name']),
                        subtitle: Text(recipe['description']),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            ),
    );
  }
}
