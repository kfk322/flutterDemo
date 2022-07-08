import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key? key}) : super(key: key);

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  List<Map> _imgList = [
    {
      "url": "images/bg01.jpg",
    },
    {
      "url": "images/bg02.jpg",
    },
    {
      "url": "images/bg03.jpg",
    },
    {
      "url": "images/bg04.jpg",
    },
    {
      "url": "images/bg05.jpg",
    },
    {
      "url": "images/bg07.jpg",
    },
  ];

  void _alertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text("Alert..."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, "Ok"),
                  child: Text("Ok...")),
              TextButton(
                  onPressed: () => Navigator.pop(context, "Cancel"),
                  child: Text("Cancel..."))
            ],
          );
        });
  }

  void _simpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Simple Dialog"),
            children: [
              SimpleDialogOption(
                child: Text("Option 1"),
                onPressed: () {},
              ),
              SimpleDialogOption(
                child: Text("Option 2"),
                onPressed: () {},
              )
            ],
          );
        });
  }

  void _modalBottomSheet() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(150))),
            height: 180,
            child: Column(
              children: [
                ListTile(
                  title: Text("Share A"),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Share B"),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("Share C"),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }

  void _toast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _CustomAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Swiper and Dialog"),
        ),
        body: Column(
          children: [
            Container(
                height: 200,
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Swiper(
                    loop: true,
                    autoplay: true,
                    itemCount: _imgList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        _imgList[index]["url"],
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                )),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () => _CustomAlertDialog(),
                    child: Text("Custom Alert Dialog")),
                ElevatedButton(
                    onPressed: () => _alertDialog(),
                    child: Text("Alert Dialog")),
                ElevatedButton(
                    onPressed: () => _simpleDialog(),
                    child: Text("Simple Dialog")),
                ElevatedButton(
                    onPressed: () => _modalBottomSheet(),
                    child: Text("Modal Bottom Sheet")),
                ElevatedButton(onPressed: () => _toast(), child: Text("Toast")),
              ],
            )
          ],
        ));
  }
}

class MyDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text("=="),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(child: Icon(Icons.close)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
