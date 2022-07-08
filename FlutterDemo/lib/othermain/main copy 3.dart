// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:untitled/res/listData.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Demo 04"),
            ),
            body: HomeContent()));
  }
}

class HomeContent extends StatelessWidget {
  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(ListTile(
        title: Text("Im on the Next Level ${i + 1}"),
      ));
    }
    return list;
  }

  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return ListTile(
        title: Text(value["title"]),
        subtitle: Text("author: ${value["author"]}"),
        leading: Image.network(value["ImageUrl"]),
        trailing: Icon(Icons.arrow_circle_right),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getListData(),
    );
  }
}
