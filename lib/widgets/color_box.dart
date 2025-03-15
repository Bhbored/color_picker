import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorBox extends StatelessWidget {
  final int red;
  final int green;
  final int blue;
  final VoidCallback onCopy;

  ColorBox({required this.red, required this.green, required this.blue, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCopy,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500), // Animation duration
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(red, green, blue, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Hex color code in the center
            Center(
              child: Text(
                '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // "Tap to Copy" hint in the bottom-right corner
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3), // Semi-transparent background
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Tap to Copy',
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}