import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/widgets/nearly_place_tile.dart';
import 'package:travel_guide/widgets/top_recommendation_tile.dart';
import 'package:travel_guide/widgets/upcoming_event_tile.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlacesProvider>(context);
    final places = placesProvider.places;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreHeader(),
              const SizedBox(height: 20.0),
              const NearlyPlaceTitle(),
              const SizedBox(height: 20.0),
              NearlyPlaceWidget(places: places),
              const SizedBox(height: 20.0),
              const TopRecommendationTitle(),
              const SizedBox(height: 20.0),
              TopPlaceRecommendationWidget(places: places),
              const SizedBox(height: 20.0),
              const UpcomingEventTitle(),
              UpcomingEventWidget(places: places),
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
            style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.grey.shade600),
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
            style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class NearlyPlaceTitle extends StatelessWidget {
  const NearlyPlaceTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Nearly Places',
        style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class UpcomingEventWidget extends StatelessWidget {
  const UpcomingEventWidget({
    super.key,
    required this.places,
  });

  final List<Places> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 20 : 15.0, left: 20.0, right: 20.0, bottom: 4 == index ? 15.0 : 0),
          child: Row(
            children: [
              UpComingEventTile(trendingEvents: places[index]),
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

  final List<Places> places;

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

class NearlyPlaceWidget extends StatelessWidget {
  const NearlyPlaceWidget({
    super.key,
    required this.places,
  });

  final List<Places> places;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20 : 12.0),
            child: Row(
              children: [
                NearlyPlaceTile(nearlyPlace: places[index]),
              ],
            ),
          );
        },
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
