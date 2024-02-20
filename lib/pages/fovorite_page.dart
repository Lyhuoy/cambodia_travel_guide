import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/widgets/favorite_event_tile.dart';
import 'package:travel_guide/widgets/favorite_place_tile.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placesProvider = Provider.of<TravelProvider>(context);
    final favoritePlaces = placesProvider.favoritePlaces;
    final favoriteEvents = placesProvider.favoriteEvents;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Favorite'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Places",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Events",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          favoritePlaces.isEmpty
              ? Center(
                  child: Lottie.asset(
                    'assets/lotties/empty.json',
                    height: 300,
                    width: 300,
                    frameRate: FrameRate.max,
                  ),
                )
              : ListView.builder(
                  itemCount: favoritePlaces.length,
                  itemBuilder: (context, index) {
                    final place = favoritePlaces[index];
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 20.0 : 0),
                      child: FavoritePlaceTile(
                        favoritePlace: place,
                        favoritePlacesLength: favoritePlaces.length,
                        index: index,
                      ),
                    );
                  },
                ),
          favoriteEvents.isEmpty
              ? Center(
                  child: Lottie.asset(
                    'assets/lotties/empty.json',
                    height: 300,
                    width: 300,
                    frameRate: FrameRate.max,
                  ),
                )
              : ListView.builder(
                  itemCount: favoriteEvents.length,
                  itemBuilder: (context, index) {
                    final event = favoriteEvents[index];
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 20.0 : 0),
                      child: FavoriteEventTile(
                        upcomingEvent: event,
                        upcomingEventsLength: favoriteEvents.length,
                        index: index,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
