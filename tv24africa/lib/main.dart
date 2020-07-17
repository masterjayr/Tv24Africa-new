import 'package:flutter/material.dart';
import 'package:tv24africa/screens/home.dart';
import 'package:tv24africa/screens/live_stream.dart';
import 'package:tv24africa/screens/news.dart';
import './screens/home_drawer.dart';



void main()=>runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex){
    switch (currentIndex) {
      case 0: return HomePage();
      case 1: return LiveStream();
      case 2: return News();
      // case 3: return SettingsPage();
        
        break;
      default:
    }


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tv24 Africa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF262626),
        secondaryHeaderColor: Color(0xFF262626),
      ),
      home: Scaffold(
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
        body:callPage(_currentIndex),
        // backgroundColor: Colors.black12,
        bottomNavigationBar:BottomNavigationBar(
          // type: BottomNavigationBarType.shifting,
          backgroundColor: Color(0xFF262626),
          selectedItemColor:Color(0xFFff0000),
          unselectedItemColor:Color(0xFfffffff),
          currentIndex: _currentIndex,
          onTap: (value){
            _currentIndex = value;
            setState(() {
              
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title: Text('Home'),
            ),
             BottomNavigationBarItem(
              icon:Icon(Icons.live_tv),
              title: Text('Live TV'),
            ),
            // 
             BottomNavigationBarItem(
              icon:Icon(Icons.notification_important),
              title: Text('News'),
            ),
            
          ],
        ),
      ),
      
    );
  }
}



// AIzaSyA4Zy6yDJjS1kX0DaVOFlg3DHouNE56Sp4

//youtube api kry
// AIzaSyDHo_zZZ01q0DQQE3ury6kVws1MiMBEdnw
// UCuBry0S8HC_vRVJHzKA7dyg