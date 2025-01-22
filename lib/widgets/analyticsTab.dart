import "package:flutter/material.dart";
import 'package:fl_chart/fl_chart.dart';

Widget analyticsTab(){
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: 500,
          child: tripsBarChart(),
        ),
      )
    ],
  )
  ;
}
Widget tripsBarChart(){

  AxisTitles chartAxisTitle(String title) => AxisTitles(
      axisNameWidget: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      )
  );

  List<BarChartGroupData> generateBarGroups() {
    List<BarChartGroupData> output = [
      BarChartGroupData(
        x: 0,
        barRods: [BarChartRodData(toY: 8, color: Colors.blue)],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [BarChartRodData(toY: 10, color: Colors.red)],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [BarChartRodData(toY: 14, color: Colors.green)],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [BarChartRodData(toY: 15, color: Colors.orange)],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [BarChartRodData(toY: 10, color: Colors.black)],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [BarChartRodData(toY: 5, color: Colors.yellow)],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [BarChartRodData(toY: 25, color: Colors.green)],
      ),
    ];
    return output;
  }

  return BarChart(
      BarChartData(
        barGroups: generateBarGroups(),
        borderData: FlBorderData(show: true),
        titlesData: FlTitlesData(
          topTitles: chartAxisTitle('1/1/2025 - 1/7/2025 Drives'),
          leftTitles: chartAxisTitle('# of Drives'),
          bottomTitles: chartAxisTitle('Weekday'),
        ),
      )
  );
}