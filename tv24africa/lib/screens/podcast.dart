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
      backgroundColor: Color(0xFF262626),
        appBar:AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tv24',
              style: TextStyle(
                color: Color(0xFFff0000),
                fontSize: 30,
                ),
              ),
              Text('Africa', 
              style:TextStyle(
                color: Color(0xFFff0000),
                fontSize: 44,
              ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: MainDrawer(),
      
    );
  }
}
