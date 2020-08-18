import 'package:flutter/material.dart';

class Tip extends StatefulWidget {
  @override
  _TipState createState() => _TipState();
}

class _TipState extends State<Tip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tip"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        
      ),
    );
  }
}