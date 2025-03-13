import 'package:color_picker/widgets/appbar.dart';
import 'package:color_picker/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import '../widgets/color_box.dart';
import '../widgets/color_slider.dart';
import '../widgets/random_color_button.dart';
import 'dart:math';

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
    final Random random = Random(); // Create a Random object
    setState(() {
      red = random.nextInt(256); // Generates a random number between 0 and 255
      green = random.nextInt(
        256,
      ); // Generates a random number between 0 and 255
      blue = random.nextInt(256); // Generates a random number between 0 and 255
    });
  }

  void _copyHexToClipboard() {
    final hexColor =
        '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}';
    FlutterClipboard.copy(hexColor).then((_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Copied $hexColor to clipboard!')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace this with your custom AppBar
      appBar:
          GradientAppBarFb1(), // Replace `MyCustomAppBar` with your AppBar widget
      // Replace this with your custom Drawer
      drawer: DrawerFb1(),
      // Replace `MyCustomDrawer` with your Drawer widget
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover
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
              SizedBox(height: 20),
              RandomColorButton(onPressed: _generateRandomColor),
            ],
          ),
        ),
      ),
    );
  }
}
