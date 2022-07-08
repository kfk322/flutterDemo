import 'package:flutter/material.dart';

class AppBarDemoPage extends StatelessWidget {
  const AppBarDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("AppBarDemo"),
            backgroundColor: Colors.red,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => print("menu"),
            ),
            actions: [
              IconButton(
                  onPressed: () => print("search"), icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () => print("settings"),
                  icon: Icon(Icons.settings))
            ],
            bottom: TabBar(tabs: [
              Tab(text: "Trending"),
              Tab(
                text: "Recommended",
              )
            ]),
          ),
          body: TabBarView(children: [
            ListView(
              children: [
                ListTile(
                  title: Text("Trending 1"),
                ),
                ListTile(
                  title: Text("Trending 2"),
                ),
                ListTile(
                  title: Text("Trending 3"),
                ),
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text("Recommended 1"),
                ),
                ListTile(
                  title: Text("Recommended 2"),
                ),
                ListTile(
                  title: Text("Recommended 3"),
                ),
              ],
            )
          ]),
        ),
      );
}
