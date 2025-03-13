import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientAppBarFb1 extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const GradientAppBarFb1({super.key})
    : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    // Light pink-themed colors
    const primaryColor = Color(0xFFFFC0CB); // Light Pink
    const secondaryColor = Color(0xFFFF69B4); // Hot Pink

    return AppBar(
      centerTitle: true,
      title: Text(
        "RainbowRush",
        style: GoogleFonts.nunito(
          color: Colors.white, // Keep the text white for contrast
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: primaryColor,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }
}