import 'package:flutter/material.dart';

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
        duration: Duration(milliseconds: 300),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromRGBO(red, green, blue, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '#${red.toRadixString(16).padLeft(2, '0')}${green.toRadixString(16).padLeft(2, '0')}${blue.toRadixString(16).padLeft(2, '0')}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}