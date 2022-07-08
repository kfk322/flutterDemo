import 'package:flutter/material.dart';

class TabControllerDemo extends StatefulWidget {
  const TabControllerDemo({Key? key}) : super(key: key);

  @override
  State<TabControllerDemo> createState() => _TabControllerDemoState();
}

class _TabControllerDemoState extends State<TabControllerDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Tab Controller"),
          bottom: TabBar(controller: _tabController, tabs: [
            Tab(
              text: "Hottest",
            ),
            Tab(
              text: "Recommended",
            ),
          ]),
        ),
        body: TabBarView(controller: _tabController, children: [
          Center(child: Text("Hottest")),
          Center(child: Text("Recommended"))
        ]),
      );
}
