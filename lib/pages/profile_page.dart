import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/provider/place_provider.dart';
import 'package:travel_guide/themes/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TravelProvider>(context);
    final wishListCount = provider.favoritePlacesCount;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Profile(wishListCount: wishListCount),
                const SizedBox(height: 20.0),
                const Bio(),
                const SizedBox(height: 20.0),
                const Interest(),
                const SizedBox(height: 20.0),
                const Gallery(),
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
                    image: AssetImage('assets/images/art${index + 73}.jpeg'),
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

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.wishListCount,
  });

  final int wishListCount;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // image picker
  void confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                'Yes',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                confirmLogout(context);
              },
              icon: const Icon(CupertinoIcons.square_arrow_right, color: Colors.red, size: 30),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: GestureDetector(
                          onTap: pickImage,
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile2.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: GestureDetector(
                          onTap: pickImage,
                          child: const Center(
                            child: FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Lyhuoy',
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  'Places',
                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '10',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(width: 20.0),
            Column(
              children: [
                const Text(
                  'Wishlist',
                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.wishListCount.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(width: 20.0),
            const Column(
              children: [
                Text(
                  'Followers',
                  style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '50',
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
