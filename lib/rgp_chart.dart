import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RGBChart extends StatelessWidget {
  final int red;
  final int green;
  final int blue;

  RGBChart({required this.red, required this.green, required this.blue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set a fixed height
      width: double.infinity, // Use full width
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: red.toDouble(),
                  color: Colors.red,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: green.toDouble(),
                  color: Colors.green,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: blue.toDouble(),
                  color: Colors.blue,
                ),
              ],
            ),
          ],
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        'Red',
                        style: GoogleFonts.nunito(color: Colors.red),
                      );
                    case 1:
                      return Text(
                        'Green',
                        style: GoogleFonts.nunito(color: Colors.green),
                      );
                    case 2:
                      return Text(
                        'Blue',
                        style: GoogleFonts.nunito(color: Colors.blue),
                      );
                    default:
                      return Text('');
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}