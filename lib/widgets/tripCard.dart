import 'package:flutter/material.dart';


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