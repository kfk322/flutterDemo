import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RRPage extends StatefulWidget {
  const RRPage({Key? key}) : super(key: key);

  @override
  State<RRPage> createState() => _RRPageState();
}

class _RRPageState extends State<RRPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Map userInfo = {"username": "hh", "age": 20};

    // var a = json.encode(userInfo);

    // Map b = json.decode(a);
    // print(b);
  }

  _postData() async {
    var url = Uri.parse("http://localhost:8080/books/2");
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }

  _getData() async {
    var url = Uri.parse("http://localhost:8080/books/2");
    var response = await http.get(url);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    print(response.body is String);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                _getData();
              },
              child: Text("Get Data")),
          ElevatedButton(
              onPressed: () {
                _postData();
              },
              child: Text("Post Data")),
          ElevatedButton(onPressed: () {}, child: Text("3"))
        ]),
      );
}
