import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Button Page"),
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: Text("Normal Button"),
              ),
              Container(
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: null,
                  child: Text("Normal Button"),
                ),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.home),
                  label: Text("Button"),
                  onPressed: () {}),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  onPressed: null,
                  child: Text("Round")),
              MaterialButton(
                onPressed: () {},
                child: Text("MaterialButton"),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150)))),
                  onPressed: null,
                  child: Text("==")),
              TextButton(onPressed: null, child: Text("==")),
              OutlinedButton(onPressed: null, child: Text("=="))
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.abc)),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: null,
                    child: const Icon(Icons.plus_one),
                  )
                ],
              )
            ],
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.plus_one),
        ),
      );
}
