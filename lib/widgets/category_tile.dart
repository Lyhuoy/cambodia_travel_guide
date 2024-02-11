import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_guide/themes/constants.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final IconData icon;
  final Color? backgruondColor;
  const CategoryTile({super.key, required this.category, required this.icon, this.backgruondColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: backgruondColor ?? Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 30.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: FaIcon(
              icon,
              size: 25.0,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          category,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
