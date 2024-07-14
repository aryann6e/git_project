import 'dart:ui';

import 'package:flutter/material.dart';

class Categories {
  final String title;
  final String id;
  final Color color;
  const Categories(
      {required this.title, this.color = Colors.orange, required this.id});
}
