import 'package:flutter/material.dart';
import '../main.dart';
import './home_drawer.dart';
// import 'home.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('About'),
          actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.redAccent[700],
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          )
        ],
        elevation: 0.0,
        centerTitle: true,

      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/tv.png'),
                  ), 
                ),
                SizedBox(height:5),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('\nTv24Africa  is the flagship company owned by News Media Africa set up to tell the African stories in ways never told and to give the African people the chance for their views, voices, \nideas and perspectives to be heard globally.\nContact us: News@tv24africa.com\n\n Version 1.10\n@2020',             
                style: TextStyle(fontSize:17, color: Colors.white), textAlign: TextAlign.center,  
                ),
              ),
              ],
              
            ),
          )
        ],
        
      ),
      
      
    );
      
    
  }
}
