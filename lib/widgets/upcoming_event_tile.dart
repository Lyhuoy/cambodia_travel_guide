import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/upcoming_event_model.dart';

class UpComingEventTile extends StatelessWidget {
  final UpcomingEvent upcomingEvent;
  const UpComingEventTile({Key? key, required this.upcomingEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/event-detail', arguments: upcomingEvent);
      },
      child: Row(
        children: [
          Hero(
            tag: '${upcomingEvent.image}${upcomingEvent.id}',
            child: Container(
              height: 85.0,
              width: MediaQuery.of(context).size.width * 0.29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                  image: NetworkImage(upcomingEvent.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                child: Text(
                  upcomingEvent.name,
                  style: GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.locationDot, color: Colors.grey, size: 18),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.48,
                    child: Text(
                      upcomingEvent.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
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
                    upcomingEvent.date,
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
      ),
    );
  }
}
