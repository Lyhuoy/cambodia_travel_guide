import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/provider/place_provider.dart';

class PopularPlaceListTile extends StatelessWidget {
  final Place popularPlace;
  const PopularPlaceListTile({super.key, required this.popularPlace});

  @override
  Widget build(BuildContext context) {
    final placeProvider = Provider.of<TravelProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/place-detail', arguments: popularPlace);
      },
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Hero(
                    tag: popularPlace.image,
                    child: Container(
                      height: 80.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(popularPlace.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          popularPlace.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        popularPlace.location,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          const FaIcon(FontAwesomeIcons.star, color: Colors.amber, size: 16.0),
                          const SizedBox(width: 5.0),
                          Text(
                            popularPlace.rating,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  placeProvider.toggleFavoriteStatus(popularPlace);
                },
                icon: Icon(
                  placeProvider.isFavorite(popularPlace) ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 25.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
