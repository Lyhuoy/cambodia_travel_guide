import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:travel_guide/models/place_model.dart';
import 'package:http/http.dart' as http;
import 'package:travel_guide/models/upcoming_event_model.dart';
import 'package:travel_guide/services/api_url.dart';

class PlaceService {
  static const String _baseUrl = ApiUrl.baseUrl;

  Future<List<Place>> getPopularPlace() async {
    try {
      const url = '$_baseUrl/popularPlaces';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final places = json.map((e) {
          return Place(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            image: e['image'],
            rating: e['rating'],
            review: e['review'],
            location: e['location'],
            isFavorite: e['isFavorite'],
          );
        }).toList();
        return places;
      } else {
        print('Failed to fetch popular places: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }

    return [];
  }

  Future<List<Place>> getRecommendedPlace() async {
    try {
      const url = '$_baseUrl/recommendedPlaces';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final places = json.map((e) {
          return Place(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            image: e['image'],
            rating: e['rating'],
            review: e['review'],
            location: e['location'],
            isFavorite: e['isFavorite'],
          );
        }).toList();
        return places;
      } else {
        print('Failed to fetch recommended places: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }

    return [];
  }

  // get upcoming events
  Future<List<UpcomingEvent>> getUpcomingEvent() async {
    try {
      const url = '$_baseUrl/upcomingEvents';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;

        final events = json.map((e) {
          return UpcomingEvent(
            id: e['id'],
            name: e['name'],
            image: e['image'],
            location: e['location'],
            description: e['description'],
            isFavorite: e['isFavorite'],
            date: e['date'],
          );
        }).toList();

        return events;
      } else {
        print('Failed to fetch upcoming events: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }

    return [];
  }

  // get popular place list
  Future<List<Place>> getPopularPlaceList() async {
    try {
      const url = '$_baseUrl/popularPlaceList';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final places = json.map((e) {
          return Place(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            image: e['image'],
            rating: e['rating'],
            review: e['review'],
            location: e['location'],
            isFavorite: e['isFavorite'],
          );
        }).toList();

        return places;
      } else {
        if (kDebugMode) {
          print('Failed to fetch places: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error during API call: $error');
      }
    }

    return [];
  }

  // get upcoming event list
  Future<List<UpcomingEvent>> getUpcomingEventList() async {
    try {
      const url = '$_baseUrl/upcomingEventList';
      final uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final events = json.map((e) {
          return UpcomingEvent(
            id: e['id'],
            name: e['name'],
            image: e['image'],
            location: e['location'],
            description: e['description'],
            isFavorite: e['isFavorite'],
            date: e['date'],
          );
        }).toList();

        return events;
      } else {
        if (kDebugMode) {
          print('Failed to fetch events: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error during API call: $error');
      }
    }

    return [];
  }
}
