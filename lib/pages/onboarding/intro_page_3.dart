import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/themes/constants.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Image.asset('assets/images/art90.jpeg', width: 350, height: 350, fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white.withOpacity(0.9),
                //     blurRadius: 40.0,
                //     offset: const Offset(
                //       0,
                //       -70,
                //     ),
                //   ),
                // ],
                ),
            child: Column(
              children: [
                FadeInRight(
                  child: Text(
                    'Captivating Cambodia',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(color: primaryColor, letterSpacing: .5, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                FadeInRight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Immerse in the allure of Cambodia's ancient wonders and modern charm, crafted for both locals and intrepid adventurers",
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(color: Colors.grey, letterSpacing: .5, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
