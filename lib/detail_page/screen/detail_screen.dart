import 'package:flutter/material.dart';
import 'package:recipe_app/core/database/database.dart';
import 'package:recipe_app/home_screen/screen/download_screen.dart';
import 'package:recipe_app/home_screen/widgets/recipecard.dart';
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final RecipeCard detailrecipe;

  const DetailScreen({super.key, required this.detailrecipe});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isDownloaded = false;
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();

  @override
  void initState() {
    super.initState();
    _checkIfDownloaded();
  }

  Future<void> _checkIfDownloaded() async {
    List<String> downloadedRecipes =
        await _sharedPreferencesHelper.getRecipes();

    setState(() {
      isDownloaded = downloadedRecipes.any((recipe) {
        final decodedRecipe = jsonDecode(recipe);
        return decodedRecipe['name'] == widget.detailrecipe.name;
      });
    });
  }

  void toggleDownload() async {
    setState(() {
      isDownloaded = !isDownloaded;
    });

    if (isDownloaded) {
      await _sharedPreferencesHelper.saveRecipe({
        'name': widget.detailrecipe.name,
        'description': widget.detailrecipe.description,
        'time': widget.detailrecipe.time,
        'picture': widget.detailrecipe.picture,
      });
    } else {
      await _sharedPreferencesHelper
          .deleteRecipe(widget.detailrecipe.name ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.detailrecipe.name ?? "Recipe Detail"),
        actions: [
          IconButton(
            icon: Icon(isDownloaded ? Icons.download_done : Icons.download),
            onPressed: toggleDownload,
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
                    image: NetworkImage(widget.detailrecipe.picture ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.detailrecipe.description ?? "",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Cooking Time: ${widget.detailrecipe.time} minutes',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
