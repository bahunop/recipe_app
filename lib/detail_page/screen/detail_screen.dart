import 'package:flutter/material.dart';
import 'package:recipe_app/api/api_call.dart';
import 'package:recipe_app/core/database/database.dart';
import 'dart:convert';

import 'package:recipe_app/home_screen/screen/download_screen.dart';

class DetailScreen extends StatefulWidget {
  final Articles recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();
  late bool isDownloaded;

  @override
  void initState() {
    super.initState();
    _checkIfDownloaded();
  }

  Future<void> _checkIfDownloaded() async {
    final recipes = await _sharedPreferencesHelper.getRecipes();
    final recipeTitles = recipes.map((e) => jsonDecode(e)['name']).toList();
    setState(() {
      isDownloaded = recipeTitles.contains(widget.recipe.title);
    });
  }

  Future<void> _toggleDownload() async {
    final recipes = await _sharedPreferencesHelper.getRecipes();
    final recipeTitles = recipes.map((e) => jsonDecode(e)['name']).toList();

    if (isDownloaded) {
      await _sharedPreferencesHelper.deleteRecipe(widget.recipe.title!);
    } else {
      if (!recipeTitles.contains(widget.recipe.title)) {
        await _sharedPreferencesHelper.saveRecipe({
          'name': widget.recipe.title,
          'description': widget.recipe.description,
          'time': widget.recipe.publishedAt,
          'picture': widget.recipe.urlToImage,
        });
      }
    }

    _checkIfDownloaded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title ?? ""),
        actions: [
          IconButton(
            onPressed: _toggleDownload,
            icon: Icon(isDownloaded ? Icons.download_done : Icons.download),
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DownloadScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.recipe.urlToImage ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.recipe.title ?? "",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                widget.recipe.content ?? "ERROR",
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: 3,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "TIME TO COOK :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.recipe.publishedAt ?? "")
            ],
          ),
        ),
      ),
    );
  }
}
