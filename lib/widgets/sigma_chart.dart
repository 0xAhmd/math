import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SigmaChart extends StatelessWidget {
  final int n;

  const SigmaChart({super.key, required this.n});

  double calculateCn(int n, double x) {
    double sum = 0.0;
    for (int r = 1; r <= n; r++) {
      sum += sqrt(r - 1) * pow(x, r) / (n + 1);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> points = [];
    for (double x = 1; x <= 10; x += 1) {
      points.add(FlSpot(x, calculateCn(n, x)));
    }

    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: true),
          titlesData: FlTitlesData(show: true),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.blue,
              spots: points,
              barWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}
