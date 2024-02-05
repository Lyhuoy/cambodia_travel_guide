import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/themes/constants.dart';

class PlaceTile extends StatelessWidget {
  final Places places;
  final int index;
  final int placesLength;
  const PlaceTile({super.key, required this.places, required this.index, required this.placesLength});

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<PlacesProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/place-detail', arguments: places);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 30.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          left: index == 0 ? 20.0 : 12.0,
          right: placesLength == index + 1 ? 20 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: places.image,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(places.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          places.name,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 241, 187, 48),
                              size: 15,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              places.rating.toString(),
                              style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(color: Colors.grey[700], fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              places.review,
                              style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(color: Colors.grey[700], fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        placesProvider.toggleFavoriteStatus(places);
                      },
                      icon: Icon(
                        placesProvider.isFavorite(places) ? Icons.favorite : Icons.favorite_border,
                        color: primaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
