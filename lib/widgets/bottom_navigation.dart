import 'package:flutter/material.dart';
import 'package:travel_guide/themes/constants.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 30,
              color: primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_rounded,
                size: 30,
                color: Colors.grey[300],
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                size: 30,
                color: Colors.grey[300],
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sticky_note_2,
                size: 30,
                color: Colors.grey[300],
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
