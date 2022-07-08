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
          appBar: AppBar(title: Text("Flutter Demo 06")),
          body: LayoutExpanded()),
    );
  }
}

class HomeContext extends StatelessWidget {
  List<Widget> _getListContainer() {
    List<Widget> listContainer = [];
    for (var i = 0; i < 18; i++) {
      listContainer.add(Container(
        alignment: Alignment.center,
        child: Text(
          "Hello Flutter",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        color: Colors.black,
      ));
    }
    return listContainer;
  }

  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.network(value['ImageUrl']),
          SizedBox(
            height: 10,
          ),
          Text(
            value['title'],
            textAlign: TextAlign.center,
          )
        ]),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        //childAspectRatio: 0.7,
        padding: EdgeInsets.all(10),
        children: _getListData());
  }
}

class HomeContextBuilder extends StatelessWidget {
  Widget _getListDataBuilder(context, index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.network(listData[index]['ImageUrl']),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Text(listData[index]['title'])
        ]),
        decoration:
            BoxDecoration(border: Border.all(width: 5, color: Colors.black)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: listData.length,
      itemBuilder: _getListDataBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 600,
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconContainer(
            icon: Icons.home,
            color: Colors.black,
          ),
          IconContainer(
            icon: Icons.abc,
            color: Colors.deepOrange,
          ),
          IconContainer(
            icon: Icons.holiday_village,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double size;
  Color color;
  IconData icon;

  IconContainer({required this.icon, this.size = 32, this.color = Colors.red});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
          child: Icon(
        icon,
        color: Colors.white,
        size: size,
      )),
    );
  }
}

class LayoutExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconContainer(icon: Icons.home_filled, color: Colors.black),
        ),
        Expanded(flex: 2, child: IconContainer(icon: Icons.holiday_village)),
        Expanded(
            flex: 1,
            child: IconContainer(
              icon: Icons.abc,
              color: Colors.blue,
            )),
      ],
    );
  }
}
