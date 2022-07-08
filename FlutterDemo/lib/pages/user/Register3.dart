import 'package:flutter/material.dart';
import '../Tabs.dart';

class Register3Page extends StatefulWidget {
  const Register3Page({Key? key}) : super(key: key);

  @override
  State<Register3Page> createState() => _Register3PageState();
}

class _Register3PageState extends State<Register3Page> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Register 3")),
        body: Column(children: [
          SizedBox(
            height: 40,
          ),
          Text("Complete register 3"),
          ElevatedButton(
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              // Navigator.of(context).pushAndRemoveUntil(
              //     new MaterialPageRoute(builder: ((context) => Tabs())),
              //     (route) => route == null),
              // Navigator.of(context).pop(),
              child: Text("Complete"))
        ]),
      );
}
