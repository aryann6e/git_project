import 'package:flutter/material.dart';
import 'package:food_recipes/Pages/youtube.dart';
import 'package:food_recipes/models/meal.dart';

class Categories_item_info_widget extends StatelessWidget {
  final String title;
  final String id;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final String video;

  Categories_item_info_widget({
    required this.title,
    required this.id,
    required this.video,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
  });
  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Normal';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Unknow';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else if (affordability == Affordability.Luxurious) {
      return 'Costly';
    } else {
      return 'Unknow';
    }
  }

  void Selected_food_recipe(BuildContext context) {
    Navigator.of(context).pushNamed(youtube_widget.routeName, arguments: video);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.blue,
      onTap: () => Selected_food_recipe(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.05,
                  right: 0.05,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                    // width: double.infinity,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.cookie),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.price_change_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
