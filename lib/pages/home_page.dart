import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/themes/constants.dart';
import 'package:travel_guide/widgets/my_textfield.dart';
import 'package:travel_guide/widgets/place_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const SearchBar(),
            const ExploreCard(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInLeft(
                    child: Text(
                      'Popular Places',
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(color: Colors.grey[700], fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  FadeInRight(
                    child: Text(
                      'See All',
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(color: Colors.grey[500], fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 290,
              width: double.infinity,
              child: ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, int index) {
                  return PlaceTile(
                    key: UniqueKey(),
                    places: places[index],
                    index: index,
                    placesLength: places.length,
                  );
                },
              ),
            ),
          ],
        ),
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
              color: primaryColor.withOpacity(0.4),
              blurRadius: 15.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInLeft(
                  child: Text(
                    'Explore the world \nFind Your Adventure!',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(color: Colors.grey[700], fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                FadeInRight(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.7),
                          blurRadius: 15.0,
                          offset: const Offset(0, 10),
                        ),
                      ],
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
            ZoomIn(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/art57.jpeg'),
                    fit: BoxFit.cover,
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Padding(
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
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Group1👋',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Lets go travel 🏕️',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Icon(CupertinoIcons.bell, color: Colors.grey[700], size: 40),
          ],
        ),
      ),
    );
  }
}
