import 'package:flutter/material.dart';
import 'package:tv24africa/models/channel_models.dart';
import 'package:tv24africa/services/youtube_api.dart';
import 'package:tv24africa/models/video_model.dart';
import 'package:tv24africa/screens/videos.dart' show VideoScreen;
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String liveVideoUrl = 'https://youtu.be/-c8LoR84Xjs';
  final String phoneNumber1 = "08139027050";

  Channel _channel;
  bool _isLoading = false;

  YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(liveVideoUrl),
      flags: YoutubePlayerFlags(
        hideControls: false,
        autoPlay: true,
        mute: false,
        // isLive: true,
      ),
    );

    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCuBry0S8HC_vRVJHzKA7dyg');
    setState(() {
      _channel = channel;
    });
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(video: video),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8),
          color: Color(0xFF000000),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(1, 0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(video.thumbnailUrl),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15.0, height: 8),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1a1a1a),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2.6,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () {
                    print('Player is ready.');
                  }),
              title: Container(
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                    color: Colors.white,
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF800000),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    onPressed: () {
                      callnow();
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: _channel != null
                ? NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollDetails) {
                      return false;
                    },
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: _channel.videos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 2.0),
                      itemBuilder: (BuildContext context, int index) {
                        Video video = _channel.videos[index];
                        return _buildVideo(video);
                      },
                    ),
                  )
                : Center(
                    // child: CircularProgressIndicator(
                    //   valueColor: AlwaysStoppedAnimation<Color>(
                    //     Theme.of(context).secondaryHeaderColor, // Red
                    //   ),
                    // ),
                    child: CircularProgressIndicator(),
                  ),
            hasScrollBody: true,
          )
        ],
      ),
    );
  }

  callnow() {
    String phoneNumber = "tel:" + phoneNumber1;
    launch(phoneNumber);
  }
}

//UC6Dy0rQ6zDnQuHQ1EeErGUA
