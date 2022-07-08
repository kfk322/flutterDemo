import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  final arguments;
  const ProductInfoPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Product ${widget.arguments["pid"]}")),
        body: Text("pid = ${widget.arguments["pid"]}"),
      );
}
