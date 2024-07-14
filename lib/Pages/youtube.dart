import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtube_widget extends StatefulWidget {
  static const routeName = 'Selected_food_recipe';
  final String videoUrl;
  youtube_widget(this.videoUrl);
  @override
  State<youtube_widget> createState() => _youtube_widgetState();
}

class _youtube_widgetState extends State<youtube_widget> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.white,
        progressColors: ProgressBarColors(
          playedColor: Colors.blue,
          handleColor: Colors.redAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("video"),
          ),
          body: player,
        );
      },
    );
  }
}
