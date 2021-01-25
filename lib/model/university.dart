class University {
  List<dynamic> web_pages;
  String name;

  University.fromJsonMap(Map<String, dynamic> map)
      : web_pages = map["web_pages"],
        name = map["name"];
}
