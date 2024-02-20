import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/pages/authentication/auth_page.dart';
import 'package:travel_guide/pages/authentication/forget_password_page.dart';
import 'package:travel_guide/pages/authentication/login_page.dart';
import 'package:travel_guide/pages/authentication/reset_password_page.dart';
import 'package:travel_guide/pages/authentication/sign_up_page.dart';
import 'package:travel_guide/pages/fovorite_page.dart';
import 'package:travel_guide/pages/home_page.dart';
import 'package:travel_guide/pages/main_screen.dart';
import 'package:travel_guide/pages/onboarding/onboarding_main_page.dart';
import 'package:travel_guide/pages/place_detail.dart';
import 'package:travel_guide/pages/profile_page.dart';
import 'package:travel_guide/pages/see_all_popular_place.dart';
import 'package:travel_guide/pages/see_all_upcoming_event.dart';
import 'package:travel_guide/pages/upcoming_event_detail.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/themes/constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => TravelProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      ),
      home: const OnboardingPage(),
      routes: <String, WidgetBuilder>{
        '/onboarding': (BuildContext context) => const OnboardingPage(),
        '/main': (BuildContext context) => const MainPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/place-detail': (BuildContext context) => const PlaceDetailScreen(),
        '/favorite': (BuildContext context) => const FavoritePage(),
        '/profile': (BuildContext context) => const ProfilePage(),
        '/auth': (BuildContext context) => const AuthPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignUpPage(),
        '/forget-password': (BuildContext context) => const ForgetPasswordPage(),
        '/change-password': (BuildContext context) => const ChangeNewPasswordPage(),
        '/event-detail': (BuildContext context) => const EventDetailPage(),
        '/see-all-popular-place': (BuildContext context) => const SeeAllPopularPlace(),
        '/see-all-upcoming-event': (BuildContext context) => const SeeAllEventPage(),
      },
    );
  }
}
