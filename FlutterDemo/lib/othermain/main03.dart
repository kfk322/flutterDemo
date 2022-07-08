// ignore_for_file: prefer_const_constructors, sort_child_properties_last

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
        appBar: AppBar(
          title: Text("Flutter Demo 02"),
        ),
        body: HomeContent4Pic(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            child: Text(
              "XXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXXxxXX",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textScaleFactor: 2,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.dashed,
                  letterSpacing: 5.0),
            ),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.red, width: 10.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            padding: EdgeInsets.all(20),
            transform: Matrix4.rotationZ(0.3)));
  }
}

class HomeContent4Pic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            child: ClipOval(
                //   child: Image.network(
                // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s",
                //alignment: Alignment.center,
                child: Image.asset(
              "images/bg03.jpg",
              color: Colors.black12,
              colorBlendMode: BlendMode.screen,
              //fit: BoxFit.contain,
              //repeat: ImageRepeat.repeat,
            )),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.amber,
            ))
        //       borderRadius: BorderRadius.circular(150),
        //       image: DecorationImage(
        //           image: NetworkImage(
        //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRq9dG21c4k_KADjZhQLloS_Zhs4L0vAXRskK7K1qas&s"),
        //           fit: BoxFit.cover)),
        // ),
        );
  }
}
