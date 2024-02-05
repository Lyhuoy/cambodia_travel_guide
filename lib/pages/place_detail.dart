import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/themes/constants.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlacesProvider>(context);
    final place = ModalRoute.of(context)!.settings.arguments as Places;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const PlaceDetailHeader(),
                  const SizedBox(
                    height: 20,
                  ),
                  PlaceImage(place: place),
                  const SizedBox(
                    height: 20,
                  ),
                  PlaceInfo(place: place, placesProvider: placesProvider),
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
                  AboutPlace(place: place),
                  const SizedBox(height: 20.0),
                  const Gallery(),
                  const SizedBox(height: 20.0),
                  const ExploreButton(),
                ],
              ),
            ],
          ),
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
        child: const Center(
          child: Text(
            "View Map",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
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
                  image: AssetImage('assets/images/art${index + 70}.jpeg'),
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
    required this.place,
  });

  final Places place;

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
            place.description,
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
    required this.place,
    required this.placesProvider,
  });

  final Places place;
  final PlacesProvider placesProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.name,
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Rating",
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 241, 187, 48),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    place.rating,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Text(
                    place.review,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  placesProvider.toggleFavoriteStatus(place);
                },
                child: Icon(
                  placesProvider.isFavorite(place) ? Icons.favorite : Icons.favorite_border,
                  color: primaryColor,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FaIcon(FontAwesomeIcons.mapLocationDot, color: primaryColor, size: 35)
            ],
          )
        ],
      ),
    );
  }
}

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.place,
  });

  final Places place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Hero(
        tag: place.image,
        child: Container(
          height: 270,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.7),
                blurRadius: 15.0,
                offset: const Offset(0, 10),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(place.image),
              fit: BoxFit.fitWidth,
            ),
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
            'Place Detail',
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
