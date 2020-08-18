import 'package:flutter/material.dart';

class Sport extends StatefulWidget {
  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sports"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        
      ),
    );
  }
}