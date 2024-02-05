import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_guide/themes/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Profile(),
                SizedBox(height: 20.0),
                Bio(),
                SizedBox(height: 20.0),
                Interest(),
                SizedBox(height: 20.0),
                Gallery(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gallery',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10.0),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage('assets/images/art${index + 70}.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Bio extends StatelessWidget {
  const Bio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bio',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            'I am a travel enthusiast who loves to explore new places and meet new people.',
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class Interest extends StatelessWidget {
  const Interest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interest',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Chip(
                label: Text(
                  'Travel',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: primaryColor,
              ),
              Chip(
                label: Text(
                  'Photography',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: primaryColor,
              ),
              Chip(
                label: Text(
                  'Food',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: primaryColor,
              ),
              Chip(
                label: Text(
                  'Nature',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: primaryColor,
              ),
              Chip(
                label: Text(
                  'Adventure',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: primaryColor,
              ),
              Chip(
                label: Text(
                  'Culture',
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                backgroundColor: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/profile.jpeg'),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Best Group',
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Travel Enthusiast',
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
