import 'package:flutter/material.dart';
import './Pages/youtube.dart';
import 'package:food_recipes/Pages/Selected_Categories_Page_widget.dart';
import 'package:food_recipes/Pages/Selected_food_recipes_page.dart';
import './Pages/Categories_Page_widget.dart';
import 'dart:ui';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    // [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    // );
    return MaterialApp(
      title: "HomePage",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.yellow,
        canvasColor: Colors.grey[600],
        textTheme: TextTheme().copyWith(
          bodyLarge: const TextStyle(
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          titleLarge: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Categories_Page_widget(),
      routes: {
        '/Selected_Categories_page': (context) =>
            Selected_Categories_Page_widget(),
        youtube_widget.routeName: (context) => Selected_food_recipes_page(),
      },
      onUnknownRoute: (settings) {
        //if fail to load a page or page not found in that case it will load this route/page/screen
        return MaterialPageRoute(
          builder: (context) {
            return Categories_Page_widget();
          },
        );
      },
    );
  }
}
