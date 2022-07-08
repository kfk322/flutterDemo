import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/auth/auth_service.dart';
import 'package:untitled/auth/bloc/auth_bloc.dart';
import 'package:untitled/auth/bloc/auth_event.dart';
import 'package:untitled/extensions/list/buildcontext/loc.dart';
import 'package:untitled/pages/Tabs.dart';
import 'package:untitled/pages/dialog/LogoutDialog.dart';
import 'package:untitled/routes/Routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${context.loc.my_title} - Home Page"),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  Future.delayed(Duration.zero).then((value) =>
                      context.read<AuthBloc>().add(const AuthEventLogOut()));
                  // await AuthService.firebase().logOut();
                  // Navigator.of(context)
                  //     .pushNamedAndRemoveUntil(loginPage, (route) => false);
                }
                break;
              default:
                break;
            }
          }, itemBuilder: ((context) {
            return [
              const PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: ListTile(
                      title: Text("Log Out"),
                      trailing: Icon(
                        Icons.logout,
                      )))
            ];
          }))
        ],
      ),
      body: ListView(
        children: [
          Text("Home Page",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search", arguments: {"id": 123});
              },
              // {
              //   Navigator.of(context)
              //       .push(MaterialPageRoute(builder: (context) => SearchPage()));
              // },
              child: Text("Clickme to Search Page")),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/appbardemo'),
              child: Text("Go to AppBarDemo")),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/tabControllerDemo'),
              child: Text("Go to TabControllerDemo")),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('testing')
                    .add({'timestamp': Timestamp.fromDate(DateTime.now())});

                Navigator.pushNamed(context, "/fire");
              },
              child: Text("Go to Firebase Testing Page")),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, notePage),
              child: Text("Go to Note View")),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, counterApp1Page),
              child: const Text("Go to Counter Application")),
        ],
      ),
    );
  }
}
