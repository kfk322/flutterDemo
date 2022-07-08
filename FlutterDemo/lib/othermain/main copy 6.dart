// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Text")),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
            color: Colors.red,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(children: [
            Expanded(
                flex: 2,
                child: Container(
                    height: 100,
                    child: Image.asset(
                      "images/bg03.jpg",
                      fit: BoxFit.cover,
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                  height: 100,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                        height: 50,
                        child: Image.asset(
                          "images/bg03.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        height: 50,
                        child: Image.asset(
                          "images/bg03.jpg",
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )),
            )
          ]),
        )
      ],
    );
  }
}
