import 'package:flutter/material.dart';

// import 'home.dart';

class ListenLive extends StatefulWidget {
  @override
  _ListenLiveState createState() => _ListenLiveState();
}

class _ListenLiveState extends State<ListenLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        //     actions: <Widget>[
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: IconButton(
        //       icon: Icon(
        //         Icons.home,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => HomePage()));
        //       },
        //     ),
        //   )
        // ],
          centerTitle: true,
          elevation: 0.0,
        ),
        // backgroundColor: Colors.black,
         body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/podcast.gif"),
          ),
        ],
      )
      
    );
  }
}