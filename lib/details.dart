import 'package:flutter/material.dart';

class UniDetails extends StatelessWidget {
  int _id;
  UniDetails(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UniDetails"),
      ),
      body: Text("$_id"),
    );
  }
}
