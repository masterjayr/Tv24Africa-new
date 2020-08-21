import 'package:flutter/material.dart';
import '../screens/screen_videoplays.dart';
import 'package:video_player/video_player.dart';
import 'home_drawer.dart';



class ClipVideosMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Videos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: MainDrawer(),


      body: ListView(
        children: <Widget>[
          TheRealVideo(
            videoPlayerController: VideoPlayerController.network(
              'https://youtu.be/o7JSltCqpCI'

            ),
            looping: true,

          ),
          TheRealVideo(
            videoPlayerController: VideoPlayerController.network(
              'https://youtu.be/o7JSltCqpCI'

            ),
            looping: true,

          )
        ],
      )
    );
  }
}
