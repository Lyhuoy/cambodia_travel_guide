import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/widgets/favorite_place_tile.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<TravelProvider>(context);
    final favoritePlaces = placesProvider.favoritePlaces;
    if (favoritePlaces.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: Lottie.asset(
            'assets/lotties/empty2.json',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
            frameRate: FrameRate.max,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Favorite Places',
                    style: GoogleFonts.aBeeZee(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: favoritePlaces.length,
                itemBuilder: (context, index) {
                  final place = favoritePlaces[index];
                  return FavoritePlaceTile(
                    key: UniqueKey(),
                    favoritePlace: place,
                    favoritePlacesLength: favoritePlaces.length,
                    index: index,
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
