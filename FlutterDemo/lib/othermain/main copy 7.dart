// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/res/listData.dart';

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
        body: LayoutDemo2(),
      ),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}

class HomeContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
      height: 400,
      width: 300,
      color: Colors.red,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.home, size: 32, color: Colors.white),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Icon(Icons.abc, size: 32, color: Colors.white),
          ),
          Positioned(
            top: 200,
            left: 50,
            child: Icon(Icons.search, size: 32, color: Colors.white),
          ),
        ],
      ),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //width: 200,
      child: AspectRatio(
        aspectRatio: 2.0 / 1.0,
        child: Container(color: Colors.black),
      ),
    );
  }
}

class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset("images/bg03.jpg"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s",
                    ),
                  ),
                  title: Text("Haha"),
                  subtitle: Text("Hehe"),
                ),
              ],
            )
          ]),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            ListTile(
              title: Text("Haha"),
              subtitle: Text("Hehe"),
            ),
            ListTile(
              title: Text("Haha"),
              subtitle: Text("Hehe"),
            ),
          ]),
        )
      ],
    );
  }
}

class LayoutDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset("images/bg03.jpg"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s",
                    ),
                  ),
                  title: Text("value['title']"),
                  subtitle: Text("author {value['author']}"),
                ),
              ],
            )
          ]),
        );
      }).toList(),
    );
  }
}
