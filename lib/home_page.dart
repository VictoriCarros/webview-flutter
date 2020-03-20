import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  num _stackToView = 1;
  String _url = "https://www.google.com";

  void _handleLoad(bool showLoading) {
    if (showLoading) {
      setState(() {
        _stackToView = 1;
      });
    } else {
      setState(() {
        _stackToView = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: IndexedStack(
      index: _stackToView,
      children: <Widget>[
        Container(
          child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
              onPageStarted: (String url) {
                _handleLoad(true);
              },
              onPageFinished: (String url) {
                _handleLoad(false);
              }),
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    )));
  }
}
