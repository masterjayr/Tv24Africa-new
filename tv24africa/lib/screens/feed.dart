import 'package:flutter/material.dart';
import 'package:tv24africa/screens/News_feedCategory_Screens/business.dart';
import 'package:tv24africa/screens/News_feedCategory_Screens/entertainment.dart';
import 'package:tv24africa/screens/News_feedCategory_Screens/news_africa.dart';
import '../services/wp_post_api.dart';
import 'package:html/parser.dart';

import 'News_feedCategory_Screens/politics.dart';
import 'News_feedCategory_Screens/sports.dart';
import 'News_feedCategory_Screens/tip.dart';
import 'feed_details.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: Icon(Icons.list),
        backgroundColor: Colors.red,
        onPressed: () => _onButtonPressed(),
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchWpPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map wppost = snapshot.data[index];
                    var imageUrl = wppost["featured_image_src"];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedDetails(wppost)));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image.network(imageUrl),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/load.gif',
                                    image: imageUrl,
                                  ),
                                ),
                                // Expanded(child: Container()),

                                Padding(
                                  padding: const EdgeInsets.only(top:5.0),
                                  child: Text(
                                    wppost['title']['rendered'],
                                    style: TextStyle(
                                        fontSize: 20.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      parse((wppost['excerpt']['rendered'])
                                              .toString())
                                          .documentElement
                                          .text,
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(40),
                  topRight: const Radius.circular(40),
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/1.jpg"),
                          ),
                          title: Text("Business",
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusinessCat()));
                          }),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/4.jpg")),
                      title:
                          Text("Sports", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sport()));
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/2.jpg")),
                      title: Text("Entertainment",
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Entertain()));
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/3.jpg")),
                      title: Text("Politics",
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Politics()));
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/6.png")),
                      title: Text("News Africa",
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Africa()));
                      },
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/tip.jpg")),
                      title: Text("Tip", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Tip()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
