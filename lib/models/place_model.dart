class Places {
  final String name;
  final String description;
  final String image;
  final String rating;
  final String review;
  final bool isFavorite;

  const Places({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.review,
    required this.isFavorite,
  });
}

// places list
final List<Places> places = [
  const Places(
    name: "Siem Reap",
    description: "Siem Reap, a resort town in northwestern Cambodia, is the gateway to the ruins of Angkor, the seat of the Khmer kingdom from the 9th-15th centuries. Angkor's vast complex of intricate stone buildings includes preserved Angkor Wat, the main temple, which is pictured on Cambodia's flag.",
    image: "assets/images/art46.jpeg",
    rating: "4.9",
    review: "(129 reviews)",
    isFavorite: true,
  ),
  const Places(
    name: "Kompot",
    description: "Kampot is a city on the Preaek Tuek Chhu River in southern Cambodia. It's known for its pepper plantations and salt fields. Many buildings date from the colonial period, including the Governor's Mansion. The house is now the Kampot Museum, which has exhibits on the city's history.",
    image: "assets/images/art54.jpeg",
    rating: "4.9",
    review: "(129 reviews)",
    isFavorite: false,
  ),
  const Places(
    name: "Koh Rong",
    description: "Koh Rong is an island in the Sihanoukville Province of Cambodia. It's known for its sandy coves and coral reefs, like those around Koh Rong Pier. Inland, the dense jungle terrain is dotted with coconut palms and waterfalls.",
    image: "assets/images/art51.jpeg",
    rating: "4.9",
    review: "(129 reviews)",
    isFavorite: false,
  ),
  const Places(
    name: 'Kep',
    description: "Kep (កែប, Krong Kep, also spelled Kaeb) is drawing tourists back with seafood, sunsets and hikes in butterfly-filled Kep National Park. Its impressive range of boutique hotels squarely targets a more cultured beach crowd than the party-happy guesthouses of Sihanoukville and the islands.",
    image: "assets/images/art52.jpeg",
    rating: "4.9",
    review: "(129 reviews)",
    isFavorite: true,
  ),
  const Places(
    name: "Koh Tonsay",
    description: "Koh Tonsay is a Cambodian island located off the country's southern coast in the Gulf of Thailand. Koh Tonsay it is being administered by Kep Province. Koh Tonsay is located just 4 km south of Kep town, has an area of around 2 km² and can be reached by ferry boat from the local port.",
    image: "assets/images/art55.jpeg",
    rating: "4.9",
    review: "(129 reviews)",
    isFavorite: true,
  ),
  const Places(
    name: "Battambang",
    description: "Battambang is a city on the Sangkae River in northwestern Cambodia. It's known for colonial buildings such as Sala Khaet, the former Governor’s Residence. Battambang Provincial Museum has artifacts from local Khmer temples. Nearby, Phare Ponleu Selpak is a circus and performing arts school for underprivileged children. North of the center are the ruins of Ek Phnom, an 11th-century pagoda with sandstone carvings.",
    image: "assets/images/art48.jpeg",
    rating: "4.9",
    review: "(129 reviews)",
    isFavorite: false,
  ),
  const Places(
    name: "Veal Veng",
    description: "Veal Veng, Khmer: ស្រុកវាលវែង, is a district in Pursat Province, Cambodia. The district capital is Pramoey town located 109 km by road from National Highway Number 5.",
    image: "assets/images/art82.jpeg",
    rating: "4.9",
    review: "(879 reviews)",
    isFavorite: true,
  ),
  const Places(
    name: "Svay Rieng",
    description: "Svay Rieng is a province in Cambodia. It borders the provinces of Prey Veng and Kampong Cham to the north, Kandal to the west, Prey Veng to the east, and shares an international border with Vietnam to the south and southeast. Its capital is Svay Rieng town.",
    image: "assets/images/art29.jpeg",
    rating: "4.9",
    review: "(879 reviews)",
    isFavorite: false,
  )
];
