import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/themes/constants.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // props
    final place = ModalRoute.of(context)!.settings.arguments as Places;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0, bottom: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const PlaceDetailHeader(),
                const SizedBox(
                  height: 20,
                ),
                Hero(
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
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                        Icon(
                          place.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: primaryColor,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Icon(Icons.map, color: primaryColor, size: 40),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.grey[300],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      place.description,
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 7,
                    ),
                  ],
                ),
              ],
            ),
            Container(
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
                  "Explore",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),
            ),
          ],
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
    return Row(
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
            color: Colors.white,
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
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }
}
