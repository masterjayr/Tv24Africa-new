import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class BusinessDetail extends StatelessWidget {
  Map<String, dynamic> wppost;

  BusinessDetail(this.wppost);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop()),
        elevation: 0.0,
        title: Text("Tv24Africa News Feed"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
         backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: wppost['featured_image_src']==null? Container(
                               ):Image.network(wppost['featured_image_src']),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  wppost['title']['rendered'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(
                  data: wppost['content']['rendered'],
                  onLinkTap: (String url) {
                    _launchUrl(url);
                  }
                ),
              ),
            ],
          ),
        )
      ),

      
    );
  }
}

_launchUrl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Cannot launch $link';
  }
}
