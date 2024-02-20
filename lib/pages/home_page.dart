import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/models/upcoming_event_model.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/themes/constants.dart';
import 'package:travel_guide/widgets/category_tile.dart';
import 'package:travel_guide/widgets/my_textfield.dart';
import 'package:travel_guide/widgets/place_tile.dart';
import 'package:travel_guide/widgets/top_recommendation_tile.dart';
import 'package:travel_guide/widgets/upcoming_event_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TravelProvider>(context, listen: false);

      if (!provider.isPopularPlaceLoading && provider.popularPlaces.isEmpty) {
        provider.fetchPopularPlace();
      }

      if (!provider.isRecommendedPlaceLoading && provider.recommendedPlaces.isEmpty) {
        provider.fetchRecommendedPlace();
      }

      if (!provider.isUpcomingEventLoading && provider.upcomingEvents.isEmpty) {
        provider.fetchUpcomingEvent();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TravelProvider>(context);
    final popularPlaces = provider.popularPlaces;
    final recommendedPlaces = provider.recommendedPlaces;
    final upcomingEvents = provider.upcomingEvents;

    return Scaffold(
      backgroundColor: colorBackground,
      body: provider.isPopularPlaceLoading || provider.isRecommendedPlaceLoading || provider.isUpcomingEventLoading
          ? Center(
              child: Lottie.asset(
                'assets/lotties/loading2.json',
                height: 400,
                width: 400,
                frameRate: FrameRate.max,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const SearchBar(),
                    const ExploreCard(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Discover',
                        style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const CategoryWidget(),
                    const SizedBox(height: 10.0),
                    const PopularPlaceTitle(),
                    PopularPlace(popularPlace: popularPlaces),
                    const SizedBox(height: 10.0),
                    const TopRecommendationTitle(),
                    const SizedBox(height: 10.0),
                    TopPlaceRecommendationWidget(places: recommendedPlaces),
                    const SizedBox(height: 10.0),
                    const UpcomingEventTitle(),
                    UpcomingEventWidget(upcomingEvents: upcomingEvents),
                  ],
                ),
              ),
            ),
    );
  }
}

class PopularPlaceTitle extends StatelessWidget {
  const PopularPlaceTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular Places',
            style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/see-all-popular-place');
            },
            child: Text(
              'See All',
              style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularPlace extends StatelessWidget {
  const PopularPlace({
    super.key,
    required this.popularPlace,
  });

  final List<Place> popularPlace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255,
      width: double.infinity,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: popularPlace.length,
        itemBuilder: (context, int index) {
          return PlaceTile(
            key: ValueKey(popularPlace[index].id),
            place: popularPlace[index],
            index: index,
            placesLength: popularPlace.length,
            id: popularPlace[index].id,
          );
        },
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 30.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.39,
                  child: Text(
                    'Explore the world Your Adventure!',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Explore More',
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/art572.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MyTextField(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(25),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              FontAwesomeIcons.bars,
              size: 20,
            ),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.locationDot,
                color: primaryColor,
                size: 18,
              ),
              const SizedBox(width: 5.0),
              Text(
                "Phnom Penh, ",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Cambodia',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: 50.0,
            height: 50.0,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
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
            category: 'Temple',
            icon: FontAwesomeIcons.monument,
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/see-all-popular-place'),
            child: Text(
              'See all',
              style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingEventWidget extends StatelessWidget {
  const UpcomingEventWidget({
    super.key,
    required this.upcomingEvents,
  });

  final List<UpcomingEvent> upcomingEvents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: upcomingEvents.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: index == 0 ? 10 : 15.0, left: 20.0, right: 20.0, bottom: 4 == index ? 15.0 : 0),
          child: Row(
            children: [
              UpComingEventTile(upcomingEvent: upcomingEvents[index]),
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/see-all-upcoming-event'),
            child: Text(
              'See all',
              style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
