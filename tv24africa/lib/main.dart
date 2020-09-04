import 'package:flutter/material.dart';
import 'package:tv24africa/screens/explore_prorams.dart';
import 'package:tv24africa/screens/feed.dart';
import 'package:tv24africa/screens/home.dart';
import 'package:tv24africa/screens/live_streamHome.dart';
import './screens/home_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:global_network/global_network.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  // ignore: missing_return
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return LiveStream();
      case 2:
        return News();
        case 3: 
        return ExplorePrograms();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return   StreamProvider<ConnectivityStatus>(
      create: (BuildContext context) => ConnectivityService().connectionStatusController.stream,
          child: MaterialApp(
        title: 'Tv24 Africa',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF262626),
          secondaryHeaderColor: Color(0xFF262626),
          canvasColor: Color(0xFF262626),
        ),
        home: GlobalNetwork(
          type: Displaytype.alertBox,
          errorScreen: MyApp(),
                  child: Scaffold(
            backgroundColor: Color(0xFF262626),
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Tv24',
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                  Text('Africa',
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
              centerTitle: true,
              elevation: 0.0,
            ),
            drawer: MainDrawer(),
            body: callPage(
              _currentIndex, 
            ),
            // backgroundColor: Colors.black12,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xFF262626),
              selectedItemColor: Colors.redAccent[700],
              unselectedItemColor:Colors.white,
              currentIndex: _currentIndex,
              onTap: (value) {
                _currentIndex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  title: Text('Videos'),
                ),
                //
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books, size: 25),
                  title: Text('NewsPaper'),
                ),
                 BottomNavigationBarItem(
                  icon: Icon(Icons.unfold_more),
                  title: Text('Explore'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AIzaSyA4Zy6yDJjS1kX0DaVOFlg3DHouNE56Sp4

//youtube api kry
// AIzaSyDHo_zZZ01q0DQQE3ury6kVws1MiMBEdnw
// UCuBry0S8HC_vRVJHzKA7dyg