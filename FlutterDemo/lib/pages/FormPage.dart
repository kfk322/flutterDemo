// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _flag = true;
  var _gender;
  var _gender2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username.text = "Initial value";
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _username,
                decoration: InputDecoration(hintText: "Please enter username"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(hintText: "Please enter password"),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {
                    print(_username.text);
                    print(_password.text);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                      value: _flag,
                      onChanged: (value) {
                        setState(() {
                          _flag = value!;
                        });
                      }),
                  Text(_flag ? "Chosen" : "UnChosen")
                ],
              ),
              CheckboxListTile(
                  secondary: Icon(Icons.title),
                  title: Text("Title"),
                  subtitle: Text("Subtitle"),
                  value: _flag,
                  onChanged: (value) {
                    setState(() {
                      _flag = value!;
                    });
                  }),
              Divider(),
              Row(
                children: [
                  Text("Male"),
                  Radio(
                      value: 1,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      }),
                  Text("Female"),
                  Radio(
                      value: 2,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      }),
                  Text("Result : ${_gender == 1 ? "Male" : "Female"}"),
                ],
              ),
              RadioListTile(
                  title: Text("Male"),
                  secondary: Icon(Icons.male),
                  selected: _gender2 == 1,
                  value: 1,
                  groupValue: _gender2,
                  onChanged: (value) {
                    setState(() {
                      _gender2 = value;
                    });
                  }),
              RadioListTile(
                  title: Text("Female"),
                  secondary: Icon(Icons.female),
                  selected: _gender2 == 2,
                  value: 2,
                  groupValue: _gender2,
                  onChanged: (value) {
                    setState(() {
                      _gender2 = value;
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Switch(
                  value: _flag,
                  onChanged: (value) {
                    setState(() {
                      _flag = value;
                    });
                  }),
            ],
          )));
}

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextField(),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Enter any words", border: OutlineInputBorder()),
          ),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: "password"),
          ),
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.people), labelText: "Username"),
          )
        ],
      );
}
