import 'package:flutter/material.dart';

class ListenLive extends StatefulWidget {
  @override
  _ListenLiveState createState() => _ListenLiveState();
}

class _ListenLiveState extends State<ListenLive> {
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
        )
      
    );
  }
}