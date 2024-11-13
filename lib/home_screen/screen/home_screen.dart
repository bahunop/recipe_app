import 'package:flutter/material.dart';
import 'package:recipe_app/api/api_call.dart';
import 'package:recipe_app/detail_page/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/chilli.jpg'),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Text(
                    "Browse your favourite recipes",
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: FutureBuilder<List<Articles>?>(
                      future: ApiReceive().fetchRecipes(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: Text("Failed to load recipes"));
                        }

                        return ListView.separated(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final recipe = snapshot.data?[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      recipe: recipe!,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 200,
                                height: 200,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: recipe?.urlToImage != null
                                      ? DecorationImage(
                                          image:
                                              NetworkImage(recipe!.urlToImage!),
                                          fit: BoxFit.fill,
                                        )
                                      : null,
                                  color: Colors.grey[300],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (recipe?.author != null)
                                        Text(
                                          recipe?.author ?? "Unknown",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 15,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
