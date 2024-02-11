class Place {
  final int id;
  final String name;
  final String description;
  final String image;
  final String rating;
  final String review;
  final String location;
  final bool isFavorite;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.review,
    required this.location,
    required this.isFavorite,
  });

  @override
  bool operator ==(Object other) => identical(this, other) || other is Place && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Place{id: $id, name: $name, description: $description, image: $image, rating: $rating, review: $review, location: $location, isFavorite: $isFavorite}';
  }
}
