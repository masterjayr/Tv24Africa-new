import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:tv24africa/screens/categories_detail_page/business_details_page.dart';
import 'package:tv24africa/services/categories_api%20calls/wp_business.dart';

class BusinessCat extends StatefulWidget {
  @override
  _BusinessCatState createState() => _BusinessCatState();
}

class _BusinessCatState extends State<BusinessCat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Business"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchWpBusinessPost(),
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
                                  builder: (context) => BusinessDetail(wppost)));
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
                               imageUrl==null? Container(
                               ):FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/load.gif',
                                  image: imageUrl,
                                ),
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
