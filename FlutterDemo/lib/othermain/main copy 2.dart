// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Demo 03")),
        body: HomeContentNew(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.pink,
            ),
            trailing: Icon(Icons.home),
            title: Text("HHHHHHHHHHHHHHHHHHHHHHH"),
            subtitle: Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")),
        ListTile(
          leading: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
          title: Text(
            "Spy & Family",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"),
          trailing: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
        ),
        Image.asset("images/bg03.jpg")
      ],
    );
  }
}

class HomeContentNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 300,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: 180,
              height: 180,
              color: Colors.red,
            ),
            Container(
              width: 180,
              height: 180,
              color: Colors.black,
            ),
            Container(
              width: 180,
              height: 180,
              color: Colors.blue,
            ),
            Container(
              width: 180,
              height: 180,
              color: Colors.pink,
            ),
            Container(
              width: 180,
              height: 180,
              color: Colors.red,
            ),
            Container(
              width: 180,
              height: 180,
              color: Colors.black,
            ),
            Container(
              width: 180,
              height: 180,
              color: Colors.blue,
            )
          ],
        ));
  }
}
