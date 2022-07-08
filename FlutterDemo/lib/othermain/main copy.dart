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
        body: HomeContext(),
      ),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}

class HomeContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
        child: Text(
      "Hello Flutter 111",
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 40.0,
        color: Color.fromARGB(155, 8, 3, 55),
      ),
    ));
  }
}
