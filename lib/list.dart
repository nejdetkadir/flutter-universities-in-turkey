import 'package:flutter/material.dart';

class UniList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UniList"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Uni $index"),
            onTap: () => {Navigator.pushNamed(context, "/details/$index")},
          );
        },
      ),
    );
  }
}
