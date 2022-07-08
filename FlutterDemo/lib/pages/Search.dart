import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final arguments;
  const SearchPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("Back"),
      ),
      appBar: AppBar(
        title: Text("Search Page"),
      ),
      body: Text(
          "Search Space : ${widget.arguments != null ? widget.arguments['id'] : '0'}"),
    );
  }
}
