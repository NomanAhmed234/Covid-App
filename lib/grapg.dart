import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomGraph extends StatelessWidget {
  const CustomGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PieChart(
        PieChartData(
          centerSpaceRadius: 20,
          sections: [
            PieChartSectionData(
              color: Colors.red,
              value: 40,
              title: 'Red',
              radius: 20,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.green,
              value: 30,
              title: 'Green',
              radius: 20,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.blue,
              value: 20,
              title: 'Blue',
              radius: 20,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.yellow,
              value: 10,
              title: 'Yellow',
              radius: 20,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
        ),
      ),
    );
  }
}
