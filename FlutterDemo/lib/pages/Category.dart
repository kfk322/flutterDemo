import 'package:flutter/material.dart';
import 'FormData.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: TabBar(indicatorColor: Colors.black, tabs: [
                Tab(
                  text: "Main",
                ),
                Tab(text: "Sub")
              ]),
            ),
            body: TabBarView(
              children: [
                Container(
                    child: Column(
                  children: [
                    Text(
                      "Category Page",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FormDataPage(
                              title: "FormData123",
                            ),
                          ));
                        },
                        child: Text("Click me to Form Data Page")),
                    ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/product"),
                        child: Text("View Product"))
                  ],
                )),
                ListView(
                  children: [
                    ListTile(
                      title: Text("Sub 1"),
                    ),
                    ListTile(
                      title: Text("Sub 2"),
                    ),
                    ListTile(
                      title: Text("Sub 3"),
                    ),
                  ],
                )
              ],
            )));
  }
}
