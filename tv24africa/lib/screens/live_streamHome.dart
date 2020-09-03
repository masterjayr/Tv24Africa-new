import 'package:flutter/material.dart';
import 'package:tv24africa/models/channel_models.dart';
import 'package:tv24africa/models/video_model.dart';
import 'package:tv24africa/screens/videos.dart';
import 'package:tv24africa/services/youtube_api.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveStream extends StatefulWidget {
  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
    Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
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

  // _buildProfileInfo() {
  //   return Container(
  //     margin: EdgeInsets.all(20.0),
  //     padding: EdgeInsets.all(20.0),
  //     height: 100.0,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black12,
  //           offset: Offset(0, 1),
  //           blurRadius: 6.0,
  //         ),
  //       ],
  //     ),
      // child: Row(
      //   children: <Widget>[
      //     CircleAvatar(
      //       backgroundColor: Colors.white,
      //       radius: 35.0,
      //       backgroundImage: NetworkImage(_channel.profilePictureUrl),
      //     ),
      //     SizedBox(width: 12.0),
      //     Expanded(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Text(
      //             _channel.title,
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 20.0,
      //               fontWeight: FontWeight.w600,
      //             ),
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //           Text(
      //             '${_channel.subscriberCount} subscribers',
      //             style: TextStyle(
      //               color: Colors.grey[600],
      //               fontSize: 16.0,
      //               fontWeight: FontWeight.w600,
      //             ),
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
  //   );
  // }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(video:video),
        ),
      ),
      child: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.all(8.0),
        height: 140.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
         color: Color(0xFF000000),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
                          child: Image(
                width: 150.0,
                image: NetworkImage(video.thumbnailUrl),
              ),
            ),
            SizedBox(width: 8.0, height: 8),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel.videos.length != int.parse(_channel.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 2.0),
                itemCount:  _channel.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  // if (index == 0) {
                  //   return _buildProfileInfo();
                  // }
                  Video video = _channel.videos[index ];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              // child: CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(
              //     Theme.of(context).primaryColor, // Red
              //   ),
              // ),

              child: CircularProgressIndicator(),
            ),
    );
    
    
  }
}
