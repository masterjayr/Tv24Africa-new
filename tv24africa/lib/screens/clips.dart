import 'package:flutter/material.dart';

import 'home_drawer.dart';
class ClipVid extends StatefulWidget {
  @override
  _ClipVidState createState() => _ClipVidState();
}

class _ClipVidState extends State<ClipVid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262626),
        appBar:AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Videos',
              style: TextStyle(
                color: Color(0xFFff0000),
                fontSize: 30,
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: MainDrawer(),
      body: Container(
        
      ),
    );
  }
}