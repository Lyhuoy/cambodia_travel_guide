import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/place_model.dart';

class TopRecommendationTile extends StatelessWidget {
  final Place topRecommendationPlace;
  const TopRecommendationTile({super.key, required this.topRecommendationPlace});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/place-detail', arguments: topRecommendationPlace);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: topRecommendationPlace.image,
            child: Container(
              height: 110.0,
              width: 160.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                  image: NetworkImage(topRecommendationPlace.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            topRecommendationPlace.name,
            style: GoogleFonts.aBeeZee(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.locationDot, color: Colors.grey, size: 18),
              const SizedBox(width: 5.0),
              Text(
                topRecommendationPlace.location,
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
