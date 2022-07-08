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
        appBar: AppBar(title: Text("Flutter Demo 05")),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  // List list = [];
  // HomeContent() {
  //   for (var i = 0; i < 10; i++) {
  //     list.add(("Im on the Next Level ${i + 1}"));
  //   }
  // }

  Widget _getListData(context, index) {
    return ListTile(
      leading: Image.network(listData[index]['ImageUrl']),
      title: Text(listData[index]['title']),
      subtitle: Text("author: ${listData[index]['author']}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: _getListData,
    );
  }
}
