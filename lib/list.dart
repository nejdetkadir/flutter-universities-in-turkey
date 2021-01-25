import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universities_in_turkey/model/university.dart';

class UniList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UniList();
}

class _UniList extends State<UniList> {
  Future<List<University>> _gonderiGetir() async {
    var response = await http
        .get("http://universities.hipolabs.com/search?country=turkey");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => University.fromJsonMap(data))
          .toList();
    } else {
      throw Exception("Error : ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Universities in Turkey"),
      ),
      body: FutureBuilder(
        future: _gonderiGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    elevation: 10,
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                      title: Text(snapshot.data[index].name),
                      onTap: () => {
                        Navigator.pushNamed(context,
                            "/details/${snapshot.data[index].web_pages.length == 1 ? snapshot.data[index].web_pages[0] : snapshot.data[index].web_pages[1]}")
                      },
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
