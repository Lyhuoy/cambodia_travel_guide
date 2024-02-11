import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/provider/place_provider.dart';

class PlaceTile extends StatelessWidget {
  final Place place;
  final int index;
  final int placesLength;
  final int id;
  const PlaceTile({super.key, required this.place, required this.index, required this.placesLength, required this.id});

  @override
  Widget build(BuildContext context) {
    final placeProvider = Provider.of<TravelProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/place-detail', arguments: place);
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
          left: index == 0 ? 20.0 : 10.0,
          right: placesLength == index + 1 ? 20 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: place.image,
              child: Container(
                height: 170,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(place.image),
                    fit: BoxFit.cover,
                  ),
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
                          width: 40,
                          height: 40,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: IconButton(
                                  onPressed: () {
                                    placeProvider.toggleFavoriteStatus(place);
                                  },
                                  icon: Icon(
                                    placeProvider.isFavorite(place) ? Icons.favorite : Icons.favorite_border,
                                    color: placeProvider.isFavorite(place) ? Colors.red : Colors.white,
                                    size: 25,
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                width: 190,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          place.name,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(color: Colors.grey[700], fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color.fromARGB(255, 241, 187, 48), size: 18),
                            const SizedBox(width: 3.0),
                            Text(
                              place.rating,
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.locationDot,
                          color: Colors.grey,
                          size: 15,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          place.location,
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
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
