import 'package:flutter/material.dart';
import 'package:try_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 86, 10, 99),
          Color.fromARGB(255, 10, 103, 179),
        ),
      ),
    ),
  );
}
