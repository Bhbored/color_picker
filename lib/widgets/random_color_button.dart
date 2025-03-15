import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RandomColorButton extends StatelessWidget {
  final VoidCallback onPressed;

  RandomColorButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF69B4), // Pink color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Smaller padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Slightly rounded corners
        ),
        elevation: 5, // Add a subtle shadow
        shadowColor: Color(0xFFFF69B4).withOpacity(0.3), // Shadow color
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Make the row take only the space it needs
        children: [
          Icon(
            Icons.color_lens, // Cute icon for color generation
            size: 20, // Smaller icon size
            color: Colors.white,
          ),
          SizedBox(width: 10), // Space between icon and text
          Text(
            'Random Color',
            style: GoogleFonts.nunito(
              fontSize: 16, // Smaller font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ).animate().fadeIn(duration: 500.ms).scale(), // Add animation
    );
  }
}