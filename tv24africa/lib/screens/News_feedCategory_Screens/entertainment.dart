import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:tv24africa/screens/categories_detail_page/entertain_detail_page.dart';
import 'package:tv24africa/services/categories_api%20calls/entertainment_api_call.dart';

class Entertain extends StatefulWidget {
  @override
  _EntertainState createState() => _EntertainState();
}

class _EntertainState extends State<Entertain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color(0xFF1a1a1a),
      appBar: AppBar(
        title: Text("Entertainment"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body:  Container(
        child: FutureBuilder(
            future: fetchWpEntertainPost(),
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
                                  builder: (context) => EntertainDetail(wppost)));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image.network(imageUrl),
                                FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/load.gif',
                                  image: imageUrl,
                                ),
                                SizedBox(height: 10 ),
                                Text(
                                  wppost['title']['rendered'],
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
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
}