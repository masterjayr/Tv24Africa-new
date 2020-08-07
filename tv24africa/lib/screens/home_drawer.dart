import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv24africa/screens/citizens_report.dart';
import 'package:tv24africa/screens/listen_live.dart';
import 'package:tv24africa/screens/podcast.dart';
import 'package:tv24africa/screens/programs.dart';
import 'package:tv24africa/screens/settings.dart';
import './about.dart';
import 'clips.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // var categories =['Business', 'politics', 'entertainment', 'sports', 'Listen Live'];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF262626),
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        color: Color(0xFF262626),
        child: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  color: Color(0xFF262626),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(
                              top: 30,
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/tv.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text('Tv24 Africa',
                            style: GoogleFonts.mcLaren(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    child: Container(
                      child: ListTile(
                          leading: Icon(Icons.report),
                          title: Text('Submit Your Pitch  ',
                              style: GoogleFonts.mcLaren(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              )),
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CitizensReport()));
                          }),
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.picture_in_picture),
                    title: Text('Programs',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Programs()));
                    }),
                ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text('Schedule',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    }),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About',
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.switch_video),
                  title: Text('Videos',
                      style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      )),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClipVid()));
                  },
                ),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    }),
                ListTile(
                    leading: Icon(Icons.audiotrack),
                    title: Text('Listen Live',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListenLive()));
                    }),
                ListTile(
                    leading: Icon(Icons.record_voice_over),
                    title: Text('Podcast',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PodCast()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
