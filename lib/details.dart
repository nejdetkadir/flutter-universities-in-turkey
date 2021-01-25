import 'package:flutter/material.dart';

class UniDetails extends StatelessWidget {
  String url;
  UniDetails(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UniDetails"),
      ),
      body: Text("$url"),
    );
  }
}
