import 'package:flutter/material.dart';

class SuccesLog extends StatelessWidget {
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
                fontSize: 20,
              ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          child: Center(child: 
          Text("Submittion sucessfull")),
        ),
      
    );
  }
}