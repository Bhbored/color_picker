import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:color_picker/rgp_chart.dart';
import 'package:color_picker/widgets/appbar.dart';
import 'package:color_picker/widgets/color_box.dart';
import 'package:color_picker/widgets/color_slider.dart';
import 'package:color_picker/widgets/drawer.dart';
import 'package:color_picker/widgets/random_color_button.dart';
import 'package:flutter/material.dart';
// Import the custom wrapper

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int red = 0;
  int green = 0;
  int blue = 0;

  void _updateRed(int value) {
    setState(() {
      red = value;
    });
  }

  void _updateGreen(int value) {
    setState(() {
      green = value;
    });
  }

  void _updateBlue(int value) {
    setState(() {
      blue = value;
    });
  }

  void _generateRandomColor() {
    final Random random = Random();
    setState(() {
      red = random.nextInt(256);
      green = random.nextInt(256);
      blue = random.nextInt(256);
    });
  }

  void _copyHexToClipboard() {
    final hexColor =
        '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
    FlutterClipboard.copy(hexColor).then((_) {
      setState(() {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.check_circle, // Checkmark icon
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 8), // Space between icon and text
                Text(
                  'Copied $hexColor to clipboard!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, // Ensure text is readable
                  ),
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(
              red,
              green,
              blue,
              1,
            ), // Dynamic color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            behavior: SnackBarBehavior.floating, // Floating style
            margin: EdgeInsets.all(16), // Margin for floating SnackBar
            duration: Duration(seconds: 2), // Display duration
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBarFb1(), // Your existing app bar
      drawer: DrawerFb1(), // Your existing drawer
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.jpg',
            ), // Your image background
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ColorBox(
                red: red,
                green: green,
                blue: blue,
                onCopy: _copyHexToClipboard,
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 320,
                child: RGBChart(red: red, green: green, blue: blue),
              ),
              SizedBox(height: 20),
              ColorSlider(
                label: 'Red',
                value: red,
                onChanged: _updateRed,
                color: Colors.red,
              ),
              ColorSlider(
                label: 'Green',
                value: green,
                onChanged: _updateGreen,
                color: Colors.green,
              ),
              ColorSlider(
                label: 'Blue',
                value: blue,
                onChanged: _updateBlue,
                color: Colors.blue,
              ),
              SizedBox(height: 10),
              RandomColorButton(onPressed: _generateRandomColor),
            ],
          ),
        ),
      ),
    );
  }
}
