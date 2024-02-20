import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/widgets/see_all_event_tile.dart';

class SeeAllEventPage extends StatefulWidget {
  const SeeAllEventPage({super.key});

  @override
  State<SeeAllEventPage> createState() => _SeeAllEventPageState();
}

class _SeeAllEventPageState extends State<SeeAllEventPage> {
  List filteredEvents = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TravelProvider>(context, listen: false);
      if (provider.eventList.isEmpty) {
        provider.fetchEventList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final travelProvider = Provider.of<TravelProvider>(context);
    final eventList = travelProvider.eventList;

    void onSearchTextChanged(String text) {
      setState(() {
        if (text.isEmpty) {
          filteredEvents = eventList;
        } else {
          filteredEvents = eventList.where((event) => event.name.toLowerCase().contains(text.toLowerCase())).toList();
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: travelProvider.isEventListLoading
          ? Center(
              child: Lottie.asset(
                'assets/lotties/biking.json',
                height: 300,
                width: 300,
                frameRate: FrameRate.max,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: Colors.grey.shade100,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: onSearchTextChanged,
                                  decoration: const InputDecoration(
                                    hintText: 'Search for events',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: searchController.text.isEmpty ? eventList.length : filteredEvents.length,
                      itemBuilder: (context, index) {
                        final upcomingEvent = searchController.text.isEmpty ? eventList[index] : filteredEvents[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: SeeAllEventTile(
                            key: UniqueKey(),
                            upcomingEvent: upcomingEvent,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
