import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Container(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "Settings Page",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text("Login")),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: Text("Register")),
            ],
          )));
}
