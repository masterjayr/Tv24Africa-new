import 'package:flutter/material.dart';

import 'home_drawer.dart';

class PodCast extends StatefulWidget {
  @override
  _PodCastState createState() => _PodCastState();
}

class _PodCastState extends State<PodCast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Pod',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                ),
              ),
              Text('Cast', 
              style:TextStyle(
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

        body: Container(
          child: Image(
            image: AssetImage("assets/images/podcast.gif"),
          )
          
        ),
      
    );
  }
}
