import 'package:flutter/material.dart';
import 'package:universities_in_turkey/list.dart';
import 'package:universities_in_turkey/details.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UniList(),
    onGenerateRoute: (settings) {
      if (settings.name.split("/")[1] == "details") {
        return MaterialPageRoute(
          builder: (context) => UniDetails(
            int.parse(settings.name.split("/")[2]),
          ),
        );
      }
    },
  ));
}
