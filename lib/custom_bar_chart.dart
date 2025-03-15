import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomBarChart extends StatelessWidget {
  final BarChartData barChartData;

  const CustomBarChart({required this.barChartData});

  @override
  Widget build(BuildContext context) {
    // Override the problematic method
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(boldText: false), // Disable bold text
      child: BarChart(
        barChartData,
      ),
    );
  }
}