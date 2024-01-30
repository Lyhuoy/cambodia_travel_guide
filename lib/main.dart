import 'package:flutter/material.dart';
import 'package:travel_guide/pages/explore_page.dart';
import 'package:travel_guide/pages/fovorite_page.dart';
import 'package:travel_guide/pages/home_page.dart';
import 'package:travel_guide/pages/main_screen.dart';
import 'package:travel_guide/pages/onboarding/onboarding_main_page.dart';
import 'package:travel_guide/pages/place_detail.dart';
import 'package:travel_guide/themes/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
      routes: <String, WidgetBuilder>{
        '/onboarding': (BuildContext context) => const OnboardingPage(),
        '/main': (BuildContext context) => const MainPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/place-detail': (BuildContext context) => const PlaceDetailScreen(),
        '/favorite': (BuildContext context) => const FavoritePage(),
        '/explore': (BuildContext context) => const ExplorePage(),
      },
    );
  }
}
