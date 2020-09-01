// import 'package:flutter/material.dart';
// import 'package:tv24africa/screens/progresshud.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../main.dart';

// class SubmitPitch extends StatefulWidget {

//   @override
//   _SubmitPitchState createState() => _SubmitPitchState();
// }

// class _SubmitPitchState extends State<SubmitPitch> {
//    bool _isLoading = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Submit Your Pitch',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//               ), // fontFamily: ,
//             ),
//           ],
//         ),
//          actions:<Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IconButton(
//       icon: Icon(
//         Icons.home,
//         color: Colors.red,
//         size: 29,
//       ),
//       onPressed: () {
//        Navigator.of(context).pop();
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => MyApp()));
//       },
//     ),
//             )
//         ],
//         centerTitle: true,
//         elevation: 0.0,
//       ),


//        body: ProgressHUD(
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Stack(
//               children: <Widget>[
//                 WebView(
//                   initialUrl:"https://tv24africa.com/citizen-reporters/",
//                   javascriptMode: JavascriptMode.unrestricted,

//                   onPageFinished: pageFinishedLoading,
//                 ),
//               ],
//             ),
//           ),
//           inAsyncCall: _isLoading,
//           opacity: 0.0,
//         )
//         );
//   }

//    void pageFinishedLoading(String url) {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }





import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new SubmitPitch());
}

class SubmitPitch extends StatefulWidget {
  @override
  _SubmitPitchState createState() => new _SubmitPitchState();
}

class _SubmitPitchState extends State<SubmitPitch> {

  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           leading: new IconButton(
              icon: new Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Submit Your Pitch',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ), // fontFamily: ,
            ),
          ],
        ),
         actions:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
      icon: Icon(
        Icons.home,
        color: Colors.red,
        size: 29,
      ),
      onPressed: () {
       Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyApp()));
      },
    ),
            )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
        body: Container(
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)
                    ),
                child: InAppWebView(
                  initialUrl: "https://tv24africa.com/listen-live/",
                  initialHeaders: {},
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                        debuggingEnabled: true,
                    )
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onLoadStart: (InAppWebViewController controller, String url) {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onLoadStop: (InAppWebViewController controller, String url) async {
                    setState(() {
                      this.url = url;
                    });
                  },
                  onProgressChanged: (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.arrow_back, color: Colors.redAccent[700]),
                  onPressed: () {
                    if (webView != null) {
                      webView.goBack();
                    }
                  },
                ),
                 RaisedButton(
                  child: Icon(Icons.refresh, color: Colors.redAccent[700]),
                  onPressed: () {
                    if (webView != null) {
                      webView.reload();
                    }
                  },
                ),
                RaisedButton(
                  child: Icon(Icons.arrow_forward, color: Colors.redAccent[700],),
                  onPressed: () {
                    if (webView != null) {
                      webView.goForward();
                    }
                  },
                ),
               
              ],
            ),
        ])),
      ),
    );
  }
}