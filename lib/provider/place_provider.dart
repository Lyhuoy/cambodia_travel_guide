import 'package:flutter/material.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:travel_guide/models/upcoming_event_model.dart';
import 'package:travel_guide/services/api_url.dart';
import 'package:travel_guide/services/popular_service.dart';

class TravelProvider extends ChangeNotifier {
  final _service = PlaceService();
  static const String _baseUrl = ApiUrl.baseUrl;
  static String popularPlacesUrl = '$_baseUrl/popularPlaces';

  final List<Place> _popularPlaces = [];
  final List<Place> _recommendedPlaces = [];
  final List<Place> _favoritePlaces = [];
  final List<UpcomingEvent> _upcomingEvents = [];

  List<Place> get popularPlaces => _popularPlaces;
  List<Place> get recommendedPlaces => _recommendedPlaces;
  List<Place> get favoritePlaces => _favoritePlaces;
  List<UpcomingEvent> get upcomingEvents => _upcomingEvents;

  bool isPopularPlaceLoading = false;
  bool isRecommendedPlaceLoading = false;
  bool isUpcomingEventLoading = false;
  String errorMessage = '';

  Future<void> fetchPopularPlace() async {
    isPopularPlaceLoading = true;
    notifyListeners();

    try {
      final response = await _service.getPopularPlace();

      for (var place in response) {
        if (!_popularPlaces.contains(place)) {
          _popularPlaces.add(place);
        }
      }
    } finally {
      isPopularPlaceLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRecommendedPlace() async {
    isRecommendedPlaceLoading = true;
    notifyListeners();

    try {
      final response = await _service.getRecommendedPlace();

      for (var place in response) {
        if (!_recommendedPlaces.contains(place)) {
          _recommendedPlaces.add(place);
        }
      }
    } finally {
      isRecommendedPlaceLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchUpcomingEvent() async {
    isUpcomingEventLoading = true;
    notifyListeners();

    try {
      final response = await _service.getUpcomingEvent();

      for (var event in response) {
        if (!_upcomingEvents.contains(event)) {
          _upcomingEvents.add(event);
        }
      }
    } finally {
      isUpcomingEventLoading = false;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Place place) {
    final isExist = _favoritePlaces.contains(place);
    if (isExist) {
      _favoritePlaces.remove(place);
    } else {
      _favoritePlaces.add(place);
    }
    notifyListeners();
  }

  void addFavorite(Place place) {
    _favoritePlaces.add(place);
    notifyListeners();
  }

  void removeFavorite(Place place) {
    _favoritePlaces.remove(place);
    notifyListeners();
  }

  bool isFavorite(Place place) {
    return _favoritePlaces.contains(place);
  }
}
