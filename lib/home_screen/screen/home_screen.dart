import 'package:flutter/material.dart';
import 'package:recipe_app/detail_page/screen/detail_screen.dart';
import 'package:recipe_app/home_screen/widgets/recipecard.dart';

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
                    child: GridView.builder(
                      itemCount: recipesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  detailrecipe: recipesList[
                                      index], // Pass the selected recipe
                                ),
                              ),
                            );
                          },
                          child: recipesList[index], // Display the recipe card
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<RecipeCard> recipesList = [
  const RecipeCard(
    name: "Spaghetti Aglio e Olio",
    time: 20,
    description:
        "This classic Italian dish combines spaghetti tossed with sautéed garlic in olive oil, seasoned with chili flakes for a kick, and garnished with fresh parsley. It's a simple yet delicious meal that requires just a pot for boiling the pasta and a skillet for the sauce.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Chicken Curry",
    time: 45,
    description:
        "A fragrant chicken curry that is both flavorful and spicy. It features tender chicken cooked with onions, tomatoes, and a blend of spices, finished with a touch of yogurt for creaminess. This dish requires a pot for cooking and a knife for prepping the ingredients.",
    picture: 'assets/chicken.jpg',
  ),
  const RecipeCard(
    name: "Vegetable Stir Fry",
    time: 30,
    description:
        "Quick and healthy, this vegetable stir fry showcases a vibrant mix of fresh vegetables cooked at high heat in a wok with soy sauce, garlic, and ginger. Perfect for a nutritious meal in no time, just grab your wok and a spatula!",
    picture: 'assets/mango.jpg',
  ),
  const RecipeCard(
    name: "Mango Smoothie",
    time: 10,
    description:
        "On hot days, refresh yourself with a creamy mango smoothie made by blending ripe mango, yogurt, honey, and ice. It's a quick and delicious way to enjoy a healthy treat using just a blender.",
    picture: 'assets/mango.jpg',
  ),
  const RecipeCard(
    name: "Beef Tacos",
    time: 30,
    description:
        "These delicious tacos are filled with seasoned ground beef and topped with fresh lettuce, cheese, and salsa, all nestled in crunchy taco shells. This dish is easily prepared using a pan to cook the beef and a spatula for assembly.",
    picture: 'assets/chilli.jpg',
  ),
  const RecipeCard(
    name: "Caesar Salad",
    time: 15,
    description:
        "A classic Caesar salad featuring crisp romaine lettuce tossed with crunchy croutons, grated parmesan, and a tangy Caesar dressing. Simply mix your ingredients in a bowl with a whisk for a quick and healthy side dish.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Chocolate Chip Cookies",
    time: 25,
    description:
        "Bake up a batch of homemade chocolate chip cookies that are soft, chewy, and loaded with chocolate chips. This delightful treat comes together in a bowl and is baked on a sheet in the oven for the perfect cookie experience.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Tom Yum Soup",
    time: 30,
    description:
        "This spicy and sour Thai soup is packed with shrimp, lemongrass, lime leaves, chili, and mushrooms, creating a bold flavor profile. Cook it all in a pot and serve hot with a ladle for a comforting dish.",
    picture: 'assets/soup.jpg',
  ),
  const RecipeCard(
    name: "Biryani",
    time: 60,
    description:
        "A fragrant rice dish that combines basmati rice with spices, tender chicken or lamb, and onions, all cooked to perfection. This delicious one-pot meal requires a pot for simmering the ingredients together.",
    picture: 'assets/chicken.jpg',
  ),
  const RecipeCard(
    name: "Caprese Salad",
    time: 10,
    description:
        "Enjoy a fresh Italian Caprese salad with ripe tomatoes, creamy mozzarella, fragrant basil, and a drizzle of olive oil and balsamic vinegar. This vibrant dish comes together on a plate with just a knife for slicing.",
    picture: 'assets/mango.jpg',
  ),
  const RecipeCard(
    name: "Pancakes",
    time: 20,
    description:
        "Fluffy pancakes make for a delightful breakfast, prepared with a simple batter of flour, eggs, and milk, cooked on a griddle and served warm with syrup. Just grab a bowl and spatula for easy preparation.",
    picture: 'assets/chilli.jpg',
  ),
  const RecipeCard(
    name: "Sushi Rolls",
    time: 45,
    description:
        "Craft delicious Japanese sushi rolls filled with a variety of fresh fish and vegetables, all rolled up in sushi rice and nori. Use a bamboo mat for perfect rolling and a knife for slicing.",
    picture: 'assets/chicken.jpg',
  ),
  const RecipeCard(
    name: "Falafel",
    time: 40,
    description:
        "Crispy falafel made from chickpeas, garlic, and a blend of herbs and spices, perfect for serving in wraps or as a snack. Prepare the mixture in a food processor and fry for a golden finish.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Quiche",
    time: 50,
    description:
        "A savory pie filled with a delicious mixture of eggs, cheese, and vegetables, baked in a flaky pie crust. This dish is easily whisked together and baked in a pie dish for a hearty meal.",
    picture: 'assets/chilli.jpg',
  ),
  const RecipeCard(
    name: "Greek Yogurt Parfait",
    time: 10,
    description:
        "This healthy breakfast features layers of creamy Greek yogurt, crunchy granola, and sweet mixed berries, all drizzled with honey. Perfect for a quick meal using a glass and spoon.",
    picture: 'assets/mango.jpg',
  ),
  const RecipeCard(
    name: "Chili con Carne",
    time: 60,
    description:
        "A hearty chili made with ground beef, beans, tomatoes, and a variety of spices, simmered to perfection. Cooked in a pot, this filling dish is perfect for sharing on chilly days.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Lentil Soup",
    time: 40,
    description:
        "This nutritious soup is made with lentils, carrots, celery, and a flavorful broth, seasoned with spices for added depth. Easily prepared in a pot, it's a comforting dish for any occasion.",
    picture: 'assets/chilli.jpg',
  ),
  const RecipeCard(
    name: "Shrimp Scampi",
    time: 20,
    description:
        "Quick and flavorful, this shrimp scampi features succulent shrimp sautéed with garlic and butter, finished with lemon and parsley for brightness. Use a skillet for a speedy meal.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Egg Fried Rice",
    time: 15,
    description:
        "A quick and tasty fried rice dish featuring fluffy rice stir-fried with eggs, peas, and carrots, seasoned with soy sauce. Cooked in a wok, it's perfect for using up leftover rice.",
    picture: 'assets/chilli.jpg',
  ),
  const RecipeCard(
    name: "Stuffed Bell Peppers",
    time: 50,
    description:
        "Colorful bell peppers filled with a savory mixture of ground meat, rice, cheese, and spices, baked until tender. This comforting dish is prepared in a baking dish and makes for a wholesome meal.",
    picture: 'assets/soup.jpg',
  ),
  const RecipeCard(
    name: "Baked Salmon",
    time: 25,
    description:
        "Healthy baked salmon fillet seasoned with lemon and fresh herbs, roasted in the oven until flaky and tender. This easy dish requires just a baking sheet for effortless cleanup.",
    picture: 'assets/soup.jpg',
  ),
  const RecipeCard(
    name: "Chocolate Mousse",
    time: 30,
    description:
        "Rich and creamy chocolate mousse made with chocolate, cream, sugar, and eggs, chilled to perfection for a decadent dessert. Prepare it in a bowl, whisk, and let it set in the fridge.",
    picture: 'assets/spaghetti.jpg',
  ),
  const RecipeCard(
    name: "Rice Pudding",
    time: 40,
    description:
        "A comforting dessert made by simmering rice with milk, sugar, cinnamon, and vanilla until creamy. This sweet treat is easily prepared in a pot and is perfect for a cozy night in.",
    picture: 'assets/chilli.jpg',
  ),
];
