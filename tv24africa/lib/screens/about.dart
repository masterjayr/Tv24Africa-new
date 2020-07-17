import 'package:flutter/material.dart';
import './home_drawer.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text('About')

      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text('\n\nTv24Africa  is the flagship company owned by News Media Africa set up to tell the African stories in ways never told and to give the African people the chance for their views, voices, \nideas and perspectives to be heard globally.\nContact us: News@tv24africa.com\n\n\n\n\n\n\n Version 1.10\n\n\n\n\n\n\n\n\n\n\n@2020',
             
              style: TextStyle(fontSize:17, color: Colors.white), textAlign: TextAlign.center,  
              ),   
            ),
          )
        ],
        
      ),
      
      
    );
      
    
  }
}
