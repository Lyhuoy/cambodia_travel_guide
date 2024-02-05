import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/place_model.dart';

class UpComingEventTile extends StatelessWidget {
  final Places trendingEvents;
  const UpComingEventTile({super.key, required this.trendingEvents});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 85.0,
          width: 130.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            image: DecorationImage(
              image: AssetImage(trendingEvents.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trendingEvents.name,
              style: GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.locationDot, color: Colors.grey, size: 18),
                const SizedBox(width: 5.0),
                Text(
                  trendingEvents.location,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.calendar, color: Colors.grey, size: 18),
                const SizedBox(width: 5.0),
                Text(
                  "12-16 Apr 2024",
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
