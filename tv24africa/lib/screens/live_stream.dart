import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveStream extends StatefulWidget {
  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  // String videoUrl = "https://youtu.be/cGSI2OTpnO4";
  String videoUrl = "https://youtu.be/fbSWMB6-8TA";
  YoutubePlayerController _liveVideoController;

  @override
  void initState() {
    _liveVideoController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl),
        flags: YoutubePlayerFlags(autoPlay: false, mute: true, isLive: true));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          YoutubePlayer(
            controller: _liveVideoController,
          ),
          SizedBox(
            height: 30,
          ),
          // YoutubePlayer(
          //   controller:_liveVideoController,
          //   ),
        ])),
      ),
    );
  }
}
