import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.josefinSans(
        color: const Color(0xffa18249),
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
