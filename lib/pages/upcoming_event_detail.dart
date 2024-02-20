import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_guide/models/upcoming_event_model.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/themes/constants.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<TravelProvider>(context);
    final upcomingEvent = ModalRoute.of(context)!.settings.arguments as UpcomingEvent;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: const PlaceDetailHeader(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20.0),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  PlaceImage(upcomingEvent: upcomingEvent, placesProvider: placesProvider),
                  const SizedBox(
                    height: 20,
                  ),
                  PlaceInfo(upcomingEvent: upcomingEvent, placesProvider: placesProvider),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AboutPlace(upcomingEvent: upcomingEvent),
                  const SizedBox(height: 20.0),
                  const Gallery(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Road Guide", style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const RoadGuide(),
                ],
              ),
            ),
          ),
          const ExploreButton(),
        ],
      ),
    );
  }
}

class RoadGuide extends StatelessWidget {
  const RoadGuide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 30.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "207 Km",
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "National Highway 6",
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.mapLocationDot,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.7),
              blurRadius: 15.0,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.mapLocationDot, color: Colors.white, size: 20),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                "View Map",
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 12.0, right: index == 5 ? 20.0 : 0),
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/art${index * 2 + 119}.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AboutPlace extends StatelessWidget {
  const AboutPlace({
    super.key,
    required this.upcomingEvent,
  });

  final UpcomingEvent upcomingEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          ReadMoreText(
            upcomingEvent.description,
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            trimLines: 4,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
            lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
          )
        ],
      ),
    );
  }
}

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({
    super.key,
    required this.upcomingEvent,
    required this.placesProvider,
  });

  final UpcomingEvent upcomingEvent;
  final TravelProvider placesProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 1.5,
            child: Text(
              upcomingEvent.name,
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.locationDot, color: primaryColor, size: 20),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                upcomingEvent.location,
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.calendar, color: primaryColor, size: 16),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                upcomingEvent.date,
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.upcomingEvent,
    required this.placesProvider,
  });

  final UpcomingEvent upcomingEvent;
  final TravelProvider placesProvider;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${upcomingEvent.image}${upcomingEvent.id}',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          height: 270,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(upcomingEvent.image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 15.0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: IconButton(
                            onPressed: () {
                              placesProvider.toggleFavoriteEventStatus(upcomingEvent);
                            },
                            icon: Icon(
                              placesProvider.isFavoriteEvent(upcomingEvent) ? Icons.favorite : Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceDetailHeader extends StatelessWidget {
  const PlaceDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.grey,
              ),
              color: Colors.grey.shade100,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Text(
            'Event Detail',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.grey,
              ),
              color: Colors.grey.shade100,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
