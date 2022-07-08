import 'package:flutter/material.dart';

class Register2Page extends StatefulWidget {
  const Register2Page({Key? key}) : super(key: key);

  @override
  State<Register2Page> createState() => _Register2PageState();
}

class _Register2PageState extends State<Register2Page> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Register 2")),
        body: Column(children: [
          SizedBox(
            height: 40,
          ),
          Text("Complete register 2"),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/register3"),
              child: Text("Go to register 3"))
        ]),
      );
}
