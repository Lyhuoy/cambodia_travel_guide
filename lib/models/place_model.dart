import 'package:flutter/material.dart';

class Places {
  final String name;
  final String description;
  final String image;
  final String rating;
  final String review;
  final String location;
  final bool isFavorite;

  const Places({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.review,
    required this.location,
    required this.isFavorite,
  });
}

class PlacesProvider extends ChangeNotifier {
  final List<Places> _places = [
    const Places(
      name: "Angkor Wat",
      description: "Siem Reap, a resort town in northwestern Cambodia, is the gateway to the ruins of Angkor, the seat of the Khmer kingdom from the 9th-15th centuries. Angkor's vast complex of intricate stone buildings includes preserved Angkor Wat, the main temple, which is pictured on Cambodia's flag.",
      image: "assets/images/art46.jpeg",
      rating: "4.2",
      review: "(129 reviews)",
      location: "Siem Reap",
      isFavorite: true,
    ),
    const Places(
      name: "Choeung Ek",
      description: "Kampot is a city on the Preaek Tuek Chhu River in southern Cambodia. It's known for its pepper plantations and salt fields. Many buildings date from the colonial period, including the Governor's Mansion. The house is now the Kampot Museum, which has exhibits on the city's history.",
      image: "assets/images/art54.jpeg",
      rating: "4.3",
      review: "(129 reviews)",
      location: "Kompot",
      isFavorite: false,
    ),
    const Places(
      name: "Koh Rong",
      description: "Koh Rong is an island in the Sihanoukville Province of Cambodia. It's known for its sandy coves and coral reefs, like those around Koh Rong Pier. Inland, the dense jungle terrain is dotted with coconut palms and waterfalls.",
      image: "assets/images/art51.jpeg",
      rating: "4.7",
      review: "(129 reviews)",
      location: "Sihanoukville",
      isFavorite: false,
    ),
    const Places(
      name: 'National Park',
      description: "Kep (កែប, Krong Kep, also spelled Kaeb) is drawing tourists back with seafood, sunsets and hikes in butterfly-filled Kep National Park. Its impressive range of boutique hotels squarely targets a more cultured beach crowd than the party-happy guesthouses of Sihanoukville and the islands.",
      image: "assets/images/art52.jpeg",
      rating: "4.1",
      review: "(129 reviews)",
      location: "Kep",
      isFavorite: true,
    ),
    const Places(
      name: "Koh Tonsay",
      description: "Koh Tonsay is a Cambodian island located off the country's southern coast in the Gulf of Thailand. Koh Tonsay it is being administered by Kep Province. Koh Tonsay is located just 4 km south of Kep town, has an area of around 2 km² and can be reached by ferry boat from the local port.",
      image: "assets/images/art55.jpeg",
      rating: "5",
      review: "(129 reviews)",
      location: "Kep",
      isFavorite: true,
    ),
    const Places(
      name: "Sterng Songkae",
      description: "Battambang is a city on the Sangkae River in northwestern Cambodia. It's known for colonial buildings such as Sala Khaet, the former Governor’s Residence. Battambang Provincial Museum has artifacts from local Khmer temples. Nearby, Phare Ponleu Selpak is a circus and performing arts school for underprivileged children. North of the center are the ruins of Ek Phnom, an 11th-century pagoda with sandstone carvings.",
      image: "assets/images/art48.jpeg",
      rating: "4.6",
      review: "(129 reviews)",
      location: "Battambang",
      isFavorite: false,
    ),
    const Places(
      name: "Veal Veng",
      description: "Veal Veng, Khmer: ស្រុកវាលវែង, is a district in Pursat Province, Cambodia. The district capital is Pramoey town located 109 km by road from National Highway Number 5.",
      image: "assets/images/art82.jpeg",
      rating: "4.1",
      review: "(879 reviews)",
      location: "Pursat",
      isFavorite: true,
    ),
    const Places(
      name: "Dei Edth",
      description: "Svay Rieng is a province in Cambodia. It borders the provinces of Prey Veng and Kampong Cham to the north, Kandal to the west, Prey Veng to the east, and shares an international border with Vietnam to the south and southeast. Its capital is Svay Rieng town.",
      image: "assets/images/art29.jpeg",
      rating: "3.5",
      review: "(879 reviews)",
      location: "Svay Rieng",
      isFavorite: false,
    )
  ];
  List<Places> get places => _places;
  List<Places> get getPlacesByName => _places..sort((a, b) => a.name.compareTo(b.name));
  final List<Places> _favoritePlaces = [];

  List<Places> get favoritePlaces => _favoritePlaces;
  List<Places> get getFavoriteByRating => _favoritePlaces..sort((a, b) => b.rating.compareTo(a.rating));
  List<Places> get getFavoriteByLocation => _favoritePlaces..sort((a, b) => a.location.compareTo(b.location));
  List<Places> get getFavoriteByName => _favoritePlaces..sort((a, b) => a.name.compareTo(b.name));
  List<Places> get getFavoritePlaces => _favoritePlaces.where((place) => place.isFavorite).toList();

  void toggleFavoriteStatus(Places place) {
    final isExist = _favoritePlaces.contains(place);
    if (isExist) {
      _favoritePlaces.remove(place);
    } else {
      _favoritePlaces.add(place);
    }
    notifyListeners();
  }

  bool isContainFavorite(Places place) {
    return _favoritePlaces.contains(place);
  }

  void addFavorite(Places place) {
    _favoritePlaces.add(place);
    notifyListeners();
  }

  void removeFavorite(Places place) {
    _favoritePlaces.remove(place);
    notifyListeners();
  }

  bool isFavorite(Places place) {
    return _favoritePlaces.contains(place);
  }
}
