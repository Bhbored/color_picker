import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RandomColorButton extends StatefulWidget {
  final VoidCallback onPressed;

  RandomColorButton({required this.onPressed});

  @override
  _RandomColorButtonState createState() => _RandomColorButtonState();
}

class _RandomColorButtonState extends State<RandomColorButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onPressed,
      child: Transform.scale(
        scale: _scale,
        child: FloatingActionButton.extended(
          onPressed: widget.onPressed,
          backgroundColor: Color(0xFFFF69B4), // Light pink background
          elevation: 5, // Subtle shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Fully rounded corners
          ),
          label: Text(
            'Generate Random Color',
            style: GoogleFonts.nunito( // Use Nunito font
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text for contrast
            ),
          ),
          icon: Icon(Icons.color_lens, color: Colors.white), // Add an icon
        ),
      ),
    );
  }
}