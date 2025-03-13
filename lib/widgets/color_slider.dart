import 'package:flutter/material.dart';

class ColorSlider extends StatelessWidget {
  final String label;
  final int value;
  final Function(int) onChanged;
  final Color color;

  ColorSlider({required this.label, required this.value, required this.onChanged, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Slider(
          value: value.toDouble(),
          min: 0,
          max: 255,
          divisions: 255,
          label: value.toString(),
          activeColor: color,
          inactiveColor: color.withOpacity(0.3),
          onChanged: (newValue) {
            onChanged(newValue.toInt());
          },
        ),
      ],
    );
  }
}