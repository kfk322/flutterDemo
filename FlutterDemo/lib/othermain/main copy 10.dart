import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo 01"),
        ),
        body: Demo2(),
      ),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countnumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chip(
          label: Text("$countnumber"),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                countnumber++;
              });
            },
            child: Text("Click me")),
      ],
    );
  }
}

class Demo2 extends StatefulWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: list
              .map((value) => ListTile(
                    title: Text(value),
                  ))
              .toList(),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                list.add("First");
              });
            },
            child: Text("Click Click"))
      ],
    );
  }
}

class Demo3 extends StatefulWidget {
  const Demo3({Key? key}) : super(key: key);

  @override
  State<Demo3> createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
