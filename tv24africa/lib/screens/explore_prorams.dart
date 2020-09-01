// import 'package:flutter/material.dart';
// import 'package:tv24africa/screens/progresshud.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ExplorePrograms extends StatefulWidget {
//   @override
//   _ExploreProgramsState createState() => _ExploreProgramsState();
// }

// class _ExploreProgramsState extends State<ExplorePrograms> {
//   bool _isLoading = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ProgressHUD(
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Stack(
//               children: <Widget>[
//                 WebView(
//                   initialUrl:"https://tv24africa.com/programmes/",
//                   javascriptMode: JavascriptMode.unrestricted,

//                   onPageFinished: pageFinishedLoading,
//                 ),
//               ],
//             ),
//           ),
//           inAsyncCall: _isLoading,
//           opacity: 0.0,
//         )
//       //
//     );
//   }
//   void pageFinishedLoading(String url) {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }




import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// import '../main.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new ExplorePrograms());
}

class ExplorePrograms extends StatefulWidget {
  @override
  _ExploreProgramsState createState() => new _ExploreProgramsState();
}

class _ExploreProgramsState extends State<ExplorePrograms> {

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
    //    
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
                  initialUrl: "https://tv24africa.com/programmes/",
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
                      this.progress = progress / 20;
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