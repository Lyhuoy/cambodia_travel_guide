import 'package:flutter/material.dart';
import 'package:travel_guide/pages/explore_page.dart';
import 'package:travel_guide/pages/fovorite_page.dart';
import 'package:travel_guide/pages/home_page.dart';
import 'package:travel_guide/themes/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = const [
    HomePage(),
    FavoritePage(),
    ExplorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey[300],
          selectedItemColor: primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded, size: 30),
              label: "Heart",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  size: 30,
                ),
                label: 'Explore'),
          ],
        ),
      ),
      body: _children[_currentIndex],
    );
  }
}
