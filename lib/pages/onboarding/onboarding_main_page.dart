import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_guide/pages/onboarding/intro_page_1.dart';
import 'package:travel_guide/pages/onboarding/intro_page_2.dart';
import 'package:travel_guide/pages/onboarding/intro_page_3.dart';
import 'package:travel_guide/themes/constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0, keepPage: true);
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                if (index == 2) {
                  onLastPage = true;
                } else {
                  onLastPage = false;
                }
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3()
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.69),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              textDirection: TextDirection.ltr,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: primaryColor,
                dotHeight: 12,
                dotWidth: 12,
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ZoomIn(
                child: GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      Navigator.pushReplacementNamed(context, '/auth');
                    } else {
                      _pageController.animateToPage(_pageController.page!.toInt() + 1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 15.0,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        onLastPage ? "Explore" : "Next",
                        style: GoogleFonts.aBeeZee(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
