import 'package:flutter/material.dart';

import 'home.dart';
import 'home_drawer.dart';

class PodCast extends StatefulWidget {
  @override
  _PodCastState createState() => _PodCastState();
}

class _PodCastState extends State<PodCast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pod',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              'Cast',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        // actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: IconButton(
        //       icon: Icon(
        //         Icons.home,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => HomePage()));
        //       },
        //     ),
        //   )
        // ],
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: MainDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // height: MediaQuery.of(context).size.height,

          Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/podcast.gif"),
          ),
        ],
      ),
    );
  }
}
