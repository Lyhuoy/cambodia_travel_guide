import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/themes/constants.dart';

class FavoritePlaceTile extends StatelessWidget {
  final Places favoritePlace;
  final int favoritePlacesLength;
  final int index;
  const FavoritePlaceTile({super.key, required this.favoritePlace, required this.favoritePlacesLength, required this.index});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlacesProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/place-detail', arguments: favoritePlace);
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
                  tag: favoritePlace.image,
                  child: Container(
                    width: 120,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(favoritePlace.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoritePlace.name,
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationDot, color: Colors.grey, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          favoritePlace.location,
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
                        Text(
                          "Rating:",
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.star, color: Color.fromARGB(255, 241, 187, 48), size: 18),
                        Text(
                          favoritePlace.rating,
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
            IconButton(
              onPressed: () {
                placesProvider.toggleFavoriteStatus(favoritePlace);
              },
              icon: Icon(
                placesProvider.isFavorite(favoritePlace) ? Icons.favorite : Icons.favorite_border,
                color: primaryColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
