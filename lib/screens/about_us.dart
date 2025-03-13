import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFC0CB), Color(0xFFFF69B4)], // Light Pink gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    '            About Us',
                    style: GoogleFonts.nunito( // Changed to Nunito font
                      textStyle: textTheme.headlineMedium?.copyWith(
                        color: Colors.white, // White text
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    color: Colors.white, // White card background
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Who We Are",
                            style: GoogleFonts.nunito( // Changed to Nunito font
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87, // Dark text for contrast
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "RainbowRush is your ultimate color companion! "
                            "Whether you're a designer, artist, or just someone who loves colors, "
                            "we make it easy to explore, create, and share beautiful color combinations.",
                            style: GoogleFonts.nunito( // Changed to Nunito font
                              fontSize: 16,
                              color: Colors.black54, // Lighter text for content
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Our Mission",
                            style: GoogleFonts.nunito( // Changed to Nunito font
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87, // Dark text for contrast
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "We aim to inspire creativity by simplifying color discovery and generation. "
                            "With RainbowRush, you can effortlessly create, customize, and share colors "
                            "for your projects, designs, or personal use.",
                            style: GoogleFonts.nunito( // Changed to Nunito font
                              fontSize: 14,
                              color: Colors.black54, // Lighter text for content
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30), // White back icon
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}