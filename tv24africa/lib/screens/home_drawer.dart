import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv24africa/screens/listen_live.dart';
import 'package:tv24africa/screens/podcast.dart';
import 'package:tv24africa/screens/settings.dart';
import 'package:tv24africa/screens/submit_pitch.dart';
import 'package:tv24africa/screens/submit_story.dart';
import './about.dart';
// import 'clips.dart';

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
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent,),
                  child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    color: Color(0xFF1a1a1a),
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
                                  image: AssetImage('assets/images/white.png'),
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
                              ),
                              ),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: Container(
                        child: ListTile(
                            leading: Icon(Icons.report, color: Color(0xFF800000)),
                            title: Text('Submit Your Pitch  ',
                                style: GoogleFonts.mcLaren(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )),
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubmitPitch()));
                            }),
                      ),
                    ),
                  ),
                  // ListTile(
                  //     leading: Icon(Icons.picture_in_picture, color: Colors.white,),
                  //     title: Text('Programs',
                  //         style: GoogleFonts.mcLaren(
                  //           textStyle: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 15,
                  //           ),
                  //         )),
                  //     onTap: () {
                  //       Navigator.of(context).pop();
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => Programs()));
                  //     }),
                  ListTile(
                      leading: Icon(Icons.add_comment, color: Color(0xFF800000),),
                      title: Text('Submit Your Story',
                          style: GoogleFonts.mcLaren(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Story()));
                      }),
                  ListTile(
                    leading: Icon(Icons.info, color:Color(0xFF800000)),
                    title: Text('About',
                        style: GoogleFonts.mcLaren(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.switch_video, color: Colors.white),
                  //   title: Text('Videos',
                  //       style: GoogleFonts.mcLaren(
                  //         textStyle: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 15,
                  //         ),
                  //       )),
                  //   onTap: () {
                  //     Navigator.of(context).pop();
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => ClipVideosMan()));
                  //   },
                  // ),
                  ListTile(
                      leading: Icon(Icons.settings, color: Color(0xFF800000)),
                      title: Text('Settings',
                          style: GoogleFonts.mcLaren(
                            textStyle: TextStyle(
                              color: Colors.white,
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
                      leading: Icon(Icons.audiotrack, color:Color(0xFF800000)),
                      title: Text('Listen Live',
                          style: GoogleFonts.mcLaren(
                            textStyle: TextStyle(
                              color: Colors.white,
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
                      leading: Icon(Icons.record_voice_over, color: Color(0xFF800000)),
                      title: Text('Podcast',
                          style: GoogleFonts.mcLaren(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PodCast()));
                      }),
        // ListTile(
        //   leading: Icon(Icons.tag_faces,),
        //   title: Text("This is a title"),
        //   subtitle: Text("This is subtitle"),
        //   trailing: Row(          
        //     children: <Widget>[
        //     Icon(Icons.f),
        //     Icon(Icons.flight_land)
        //   ]),
        // )
      ]
    ),
              

              ),

            ),
          ),
        ),
      
    );
  }
}
