import 'package:flutter/material.dart';
import 'package:food_recipes/Pages/youtube.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/categories_data.dart';

class Selected_food_recipes_page extends StatelessWidget {
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final Sel_food_recipes_val = DUMMY_MEALS.firstWhere((meal) {
      // print('Id.....:${meal.id}');
      return meal.id == mealId;
    });

    return youtube_widget(Sel_food_recipes_val.video);

    // Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: Text(Sel_food_recipes_val.title),
    //   ),
    //   body: SingleChildScrollView(
    //       // child: Column(
    //       //   children: [
    //       //     YoutubePlayer(
    //       //       controller: _controller,
    //       //       showVideoProgressIndicator: true,
    //       //       bottomActions: [
    //       //         CurrentPosition(),
    //       //         ProgressBar(
    //       //           isExpanded: true,
    //       //           colors: const ProgressBarColors(
    //       //             playedColor: Colors.blue,
    //       //             handleColor: Colors.red,
    //       //           ),
    //       //         ),
    //       //         const PlaybackSpeedButton(),
    //       //         FullScreenButton(),
    //       //       ],
    //       //     ),
    //       //   ],
    //       // ),

    //       // child: ,
    //       ),
    // );

    // child: Container(
    //   padding: EdgeInsets.all(10),
    //   height: 300,
    // width: double.infinity,
  }
}
