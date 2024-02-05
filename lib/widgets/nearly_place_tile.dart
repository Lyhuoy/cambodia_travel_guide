import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/place_model.dart';

class NearlyPlaceTile extends StatelessWidget {
  final Places nearlyPlace;
  const NearlyPlaceTile({super.key, required this.nearlyPlace});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage(nearlyPlace.image),
        ),
        const SizedBox(height: 10.0),
        Text(
          nearlyPlace.name,
          style: GoogleFonts.aBeeZee(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
