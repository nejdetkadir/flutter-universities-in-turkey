import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UniDetails extends StatefulWidget {
  String url;
  UniDetails(this.url);

  @override
  State<StatefulWidget> createState() => _UniDetails(url);
}

class _UniDetails extends State<UniDetails> {
  String url;
  _UniDetails(this.url);

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url
            .replaceAll("http:", "https:")
            .replaceAll("bamdirma", "bandirma"), // my university :)
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),
    );
  }
}
