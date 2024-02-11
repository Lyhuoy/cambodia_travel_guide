import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/models/upcoming_event_model.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/widgets/category_tile.dart';
import 'package:travel_guide/widgets/top_recommendation_tile.dart';
import 'package:travel_guide/widgets/upcoming_event_tile.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<TravelProvider>(context);
    final upcomingEvents = placesProvider.upcomingEvents;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreHeader(),
              const SizedBox(height: 20.0),
              const CategoryTitle(),
              const SizedBox(height: 10.0),
              const CategoryWidget(),
              const SizedBox(height: 20.0),
              const TopRecommendationTitle(),
              const SizedBox(height: 10.0),
              TopPlaceRecommendationWidget(places: placesProvider.recommendedPlaces),
              const SizedBox(height: 10.0),
              const UpcomingEventTitle(),
              UpcomingEventWidget(upcomingEvent: upcomingEvents),
            ],
          ),
        ),
      ),
    );
  }
}

class UpcomingEventTitle extends StatelessWidget {
  const UpcomingEventTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Upcoming Events',
            style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'See all',
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class TopRecommendationTitle extends StatelessWidget {
  const TopRecommendationTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Recommendations',
            style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'See all',
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Discover',
        style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class UpcomingEventWidget extends StatelessWidget {
  const UpcomingEventWidget({
    super.key,
    required this.upcomingEvent,
  });

  final List<UpcomingEvent> upcomingEvent;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: upcomingEvent.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 10 : 15.0, left: 20.0, right: 20.0, bottom: 4 == index ? 15.0 : 0),
          child: Row(
            children: [
              UpComingEventTile(upcomingEvent: upcomingEvent[index]),
            ],
          ),
        );
      },
    );
  }
}

class TopPlaceRecommendationWidget extends StatelessWidget {
  const TopPlaceRecommendationWidget({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20 : 12.0),
            child: Row(
              children: [
                TopRecommendationTile(topRecommendationPlace: places[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryTile(
            category: 'Nature',
            icon: FontAwesomeIcons.tree,
          ),
          CategoryTile(
            category: 'Beach',
            icon: FontAwesomeIcons.umbrellaBeach,
          ),
          CategoryTile(
            category: 'Mountain',
            icon: FontAwesomeIcons.mountain,
          ),
          CategoryTile(
            category: 'City',
            icon: FontAwesomeIcons.city,
          ),
        ],
      ),
    );
  }
}

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore',
                style: GoogleFonts.aBeeZee(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.search,
                size: 30,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Text(
            'We hope you find what you are \nlooking for!',
            style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
