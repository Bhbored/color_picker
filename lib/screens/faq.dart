import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBody: true,
      body: Container(
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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white), // White back icon
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'FAQs',
                    style: GoogleFonts.nunito( // Changed to Nunito font
                      textStyle: textTheme.headlineMedium?.copyWith(
                        color: Colors.white, // White text
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _faqCard(
                      "How do I generate a random color?",
                      "Tap the 'Generate Random Color' button, and RainbowRush will create a unique color for you instantly!",
                    ),
                    _faqCard(
                      "Can I copy the hex value of a color?",
                      "Yes! Tap on the color box, and the hex value will be copied to your clipboard.",
                    ),
                    _faqCard(
                      "How do I adjust the RGB values?",
                      "Use the sliders for Red, Green, and Blue to manually adjust the color to your preference.",
                    ),
                    _faqCard(
                      "What is a hex color code?",
                      "A hex color code is a 6-digit code that represents a specific color. It starts with a '#' followed by a combination of numbers and letters (e.g., #FF69B4).",
                    ),
                    _faqCard(
                      "Can I use RainbowRush for design projects?",
                      "Absolutely! RainbowRush is perfect for designers, artists, and anyone who loves experimenting with colors.",
                    ),
                    _faqCard(
                      "Why are some colors not visible on the screen?",
                      "Ensure your device's brightness is turned up, and avoid using colors with very low RGB values (close to 0).",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _faqCard(String question, String answer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.white, // White card background
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: GoogleFonts.nunito( // Changed to Nunito font
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Dark text for contrast
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              answer,
              style: GoogleFonts.nunito( // Changed to Nunito font
                color: Colors.black54, // Lighter text for answers
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}