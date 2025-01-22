import "package:flutter/material.dart";
import "widgets.dart";

Widget pastTripTab(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      tripCard("Jan 19, 2025 1:00pm", "to (-35.2, -2.5)"),
      tripCard("October 1, 2024 9:00pm", "to (-35.2, -2.5)")
    ],
  );
}