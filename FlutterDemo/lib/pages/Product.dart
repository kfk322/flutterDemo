import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Page"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Product 1"),
            subtitle: Text("details..."),
            trailing: ElevatedButton(
              child: Icon(Icons.info_outline),
              onPressed: () {},
            ),
          ),
          ListTile(
              title: Text("Product 2"),
              subtitle: Text("details..."),
              trailing: ElevatedButton(
                child: Icon(Icons.info_outline),
                onPressed: () => Navigator.pushNamed(context, "/productInfo",
                    arguments: {"pid": 2}),
              )),
          ListTile(
              title: Text("Product 3"),
              subtitle: Text("details..."),
              trailing: ElevatedButton(
                child: Icon(Icons.info_outline),
                onPressed: () => Navigator.pushNamed(context, "/productInfo",
                    arguments: {"pid": 3}),
              )),
          ListTile(
              title: Text("Product 4"),
              subtitle: Text("details..."),
              trailing: ElevatedButton(
                child: Icon(Icons.info_outline),
                onPressed: () => Navigator.pushNamed(context, "/productInfo",
                    arguments: {"pid": 4}),
              )),
        ],
      ),
    );
  }
}
