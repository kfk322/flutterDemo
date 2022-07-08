import 'package:flutter/material.dart';

class FormDataPage extends StatefulWidget {
  final String title;
  const FormDataPage({Key? key, required this.title}) : super(key: key);

  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Data Page")),
      body: ListView(
        children: [
          ListTile(
            title: Text(widget.title),
          )
        ],
      ),
    );
  }
}
