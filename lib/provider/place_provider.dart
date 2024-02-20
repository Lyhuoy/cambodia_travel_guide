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
  final List<Place> _popularPlacesList = [];
  final List<UpcomingEvent> _eventList = [];
  final List<UpcomingEvent> _favoriteEvents = [];

  List<Place> get popularPlaces => _popularPlaces;
  List<Place> get recommendedPlaces => _recommendedPlaces;
  List<Place> get favoritePlaces => _favoritePlaces;
  List<UpcomingEvent> get upcomingEvents => _upcomingEvents;
  List<Place> get popularPlacesList => _popularPlacesList;

  List<UpcomingEvent> get eventList => _eventList;
  List<UpcomingEvent> get favoriteEvents => _favoriteEvents;

  int get favoritePlacesCount => _favoritePlaces.length + _favoriteEvents.length;

  bool isPopularPlaceLoading = false;
  bool isRecommendedPlaceLoading = false;
  bool isUpcomingEventLoading = false;
  bool isPopularPlaceListLoading = false;
  bool isEventListLoading = false;
  bool isFavoriteEventLoading = false;
  String errorMessage = '';

  Future<void> fetchPopularPlace() async {
    isPopularPlaceLoading = true;
    notifyListeners();

    try {
      final response = await _service.getPopularPlace();
      _popularPlaces.addAll(response);
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
      _recommendedPlaces.addAll(response);
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

      _upcomingEvents.addAll(response);
    } finally {
      isUpcomingEventLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPopularPlaceList() async {
    isPopularPlaceListLoading = true;
    notifyListeners();
    try {
      final response = await _service.getPopularPlaceList();
      _popularPlacesList.addAll(response);
    } finally {
      isPopularPlaceListLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchEventList() async {
    isEventListLoading = true;
    notifyListeners();
    try {
      final response = await _service.getUpcomingEventList();
      _eventList.addAll(response);
    } finally {
      isEventListLoading = false;
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

  void toggleFavoriteEventStatus(UpcomingEvent event) {
    final isExist = _favoriteEvents.contains(event);
    if (isExist) {
      _favoriteEvents.remove(event);
    } else {
      _favoriteEvents.add(event);
    }
    notifyListeners();
  }

  bool isFavoriteEvent(UpcomingEvent event) {
    return _favoriteEvents.contains(event);
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
