class UpcomingEvent {
  final int id;
  final String name;
  final String image;
  final String location;
  final String description;
  final bool isFavorite;
  final String date;

  UpcomingEvent({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.description,
    required this.isFavorite,
    required this.date,
  });

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpcomingEvent && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UpcomingEvent{id: $id, name: $name, location: $location, description: $description, image: $image, isFavorite: $isFavorite, date: $date}';
  }
}
