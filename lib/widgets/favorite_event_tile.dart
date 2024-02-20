import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/upcoming_event_model.dart';
import 'package:travel_guide/provider/place_provider.dart';

class FavoriteEventTile extends StatelessWidget {
  final UpcomingEvent upcomingEvent;
  final int upcomingEventsLength;
  final int index;
  const FavoriteEventTile({super.key, required this.upcomingEvent, required this.upcomingEventsLength, required this.index});

  void confirmRemove(BuildContext context, UpcomingEvent upcomingEvent) {
    final placesProvider = Provider.of<TravelProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Remove Favorite',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            'Are you sure you want to remove this event from your favorite list?',
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                placesProvider.toggleFavoriteEventStatus(upcomingEvent);
                Navigator.pop(context);
              },
              child: Text(
                'Yes',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/event-detail', arguments: upcomingEvent);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: '${upcomingEvent.image}${upcomingEvent.id}',
                  child: Container(
                    width: 120,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(upcomingEvent.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        upcomingEvent.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationDot, color: Colors.grey, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          upcomingEvent.location,
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.calendar, color: Colors.grey, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          upcomingEvent.date,
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: GestureDetector(
                onTap: () {
                  confirmRemove(context, upcomingEvent);
                },
                child: FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
