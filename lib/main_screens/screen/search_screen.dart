import 'package:flutter/material.dart';
import 'package:recipe_app/api/api_call.dart';
import 'package:recipe_app/detail_page/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Articles> allRecipes = [];
  List<Articles> foundRecipes = [];

  @override
  void initState() {
    super.initState();
    _fetchAllRecipes();
  }

  void _fetchAllRecipes() async {
    var fetchedRecipes = await ApiReceive().fetchRecipes();
    if (fetchedRecipes != null && fetchedRecipes.isNotEmpty) {
      setState(() {
        allRecipes = fetchedRecipes;
        foundRecipes = List.from(allRecipes);
      });
    } else {
      setState(() {
        allRecipes = [];
        foundRecipes = [];
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        foundRecipes = List.from(allRecipes);
      });
    } else {
      setState(() {
        foundRecipes = allRecipes.where((recipe) {
          return (recipe.author
                  ?.toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ??
              false);
        }).toList();
      });
    }
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
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
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
                            recipe: foundRecipes[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
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
                                image: NetworkImage(
                                    foundRecipes[index].urlToImage ?? ""),
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
                                  foundRecipes[index].author ??
                                      "Unknown Author",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Time Required: ${foundRecipes[index].publishedAt ?? "N/A"} minutes',
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
