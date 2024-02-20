import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/place_model.dart';

class NearlyPlaceTile extends StatelessWidget {
  final Place nearlyPlace;
  const NearlyPlaceTile({super.key, required this.nearlyPlace});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const FaIcon(
                  FontAwesomeIcons.tree,
                  size: 20.0,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10.0),
                Text(
                  nearlyPlace.name.substring(0, 3),
                  style: GoogleFonts.aBeeZee(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
