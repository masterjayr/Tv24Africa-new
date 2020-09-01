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

  YoutubePlayerController _controller;

  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(liveVideoUrl),
          flags:
    YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      isLive: true,
    ),

        );
        
  
    super.initState();
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
          borderRadius: BorderRadiusDirectional.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(4, 1),
              blurRadius: 9.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(video.thumbnailUrl),
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
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
      backgroundColor: Colors.black12,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2.6,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: YoutubePlayer(
                showVideoProgressIndicator: true,

                controller: _controller,
              ),
              title: Container(
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.bottomRight,
                child: IconButton(
                  color: Colors.white,
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent[700],
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
          SliverFillRemaining(
            child: _channel != null
                ? NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollDetails) {
                      // if (!_isLoading &&
                      //     _channel.videos.length !=
                      //         int.parse(_channel.videoCount) &&
                      //     scrollDetails.metrics.pixels ==
                      //         scrollDetails.metrics.maxScrollExtent) {
                      //   // _loadMoreVideos();
                      // }
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
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).secondaryHeaderColor, // Red
                      ),
                    ),
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
