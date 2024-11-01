import 'package:flutter/material.dart';
import 'package:recipe_app/detail_page/screen/detail_screen.dart';

import 'package:recipe_app/home_screen/screen/home_screen.dart';
import 'package:recipe_app/home_screen/widgets/recipecard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<RecipeCard> foundRecipes = [];

  @override
  void initState() {
    super.initState();
    foundRecipes = List.from(recipesList);
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      foundRecipes = List.from(recipesList);
    } else {
      foundRecipes = recipesList
          .where((recipe) =>
              recipe.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              "Search For Your Favourite Recipe.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: foundRecipes.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  detailrecipe: foundRecipes[index],
                                )),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    foundRecipes[index].picture ?? ""),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foundRecipes[index].name ?? "ERROR",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Time Required: ${foundRecipes[index].time} minutes',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
