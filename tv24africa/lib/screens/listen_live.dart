import 'package:flutter/material.dart';

class ListenLive extends StatefulWidget {
  @override
  _ListenLiveState createState() => _ListenLiveState();
}

class _ListenLiveState extends State<ListenLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tv24',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                ),
              ),
              Text('Africa', 
              style:TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        // backgroundColor: Colors.white,
      
    );
  }
}