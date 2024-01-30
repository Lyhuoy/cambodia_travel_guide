import 'package:flutter/material.dart';
import 'package:travel_guide/themes/constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.74,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Places',
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Colors.grey[500],
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            borderSide: BorderSide(color: primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
