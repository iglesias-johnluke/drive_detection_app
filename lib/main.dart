import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drive Detector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 2,
        child: MyHomePage(title: 'Drive Detector')
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: "Past Trips",),
              Tab(icon: Icon(Icons.bar_chart), text: "Analytics",),
            ],
          ),
          title: const Text('Drive Tracker')
      ),
      body: TabBarView(
          children: [
            pastTripTab(),
            analyticsTab()
          ]
      ),
    );
  }

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

    List<BarChartGroupData> _generateBarGroups() {
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
      print("mongus");
      print( output);
      return output;
    }

    return BarChart(
      BarChartData(
        barGroups: _generateBarGroups(),
        borderData: FlBorderData(show: true),
        titlesData: FlTitlesData(
          topTitles: chartAxisTitle('1/1/2025 - 1/7/2025 Drives'),
          leftTitles: chartAxisTitle('# of Drives'),
          bottomTitles: chartAxisTitle('Weekday'),
      ),
    )
    );
}

  Widget pastTripTab(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        tripCard("Jan 19, 2025 1:00pm", "to (-35.2, -2.5)"),
        tripCard("October 1, 2024 9:00pm", "to (-35.2, -2.5)")
      ],
    );
  }

  Widget tripCard(String timestamp, String destination) {
    return Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.car_crash),
                Text(
                  timestamp,
                  style: TextStyle(
                      fontSize: 20
                  ),
                )
              ],
            ),
            Text(
                destination,
                style: TextStyle(
                    fontSize: 14
                )
            )
          ],
        )
    ) ;
  }
}
