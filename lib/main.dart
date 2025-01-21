import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("Weekly Trips")
      ],
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
