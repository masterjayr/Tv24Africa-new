
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


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
       backgroundColor: Colors.black,
        body: Container(
          child: Column(children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                child: progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container()),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)
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
                  color: Colors.white,
                  child: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    if (webView != null) {
                      webView.goBack();
                    }
                  },
                ),
                 RaisedButton(
                   color: Colors.white,
                  child: Icon(Icons.refresh, color: Colors.black),
                  onPressed: () {
                    if (webView != null) {
                      webView.reload();
                    }
                  },
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Icon(Icons.arrow_forward, color: Colors.black,),
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