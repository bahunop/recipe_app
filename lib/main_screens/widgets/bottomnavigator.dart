import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/main_screens/screen/download_screen.dart';
import 'package:recipe_app/main_screens/screen/home_screen.dart';
import 'package:recipe_app/main_screens/screen/search_screen.dart';
import 'package:recipe_app/main_screens/screen/user_info.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const DownloadScreen(),
    const UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.black87,
        height: 55,
        items: const [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.download),
          Icon(Icons.person)
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
