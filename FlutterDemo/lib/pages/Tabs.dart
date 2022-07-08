// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/auth/auth_service.dart';
import 'package:untitled/auth/bloc/auth_bloc.dart';
import 'package:untitled/auth/bloc/auth_event.dart';
import 'package:untitled/auth/bloc/auth_state.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/helpers/loading/loading_screen.dart';
import 'package:untitled/pages/dialog/LogoutDialog.dart';
import 'package:untitled/pages/user/Login.dart';
import 'package:untitled/pages/user/Register.dart';
import 'package:untitled/pages/user/VerifiyEmailPage.dart';
import 'package:untitled/pages/user/forgot_password_view.dart';
import 'package:untitled/routes/Routes.dart';
import 'Category.dart';
import 'Home.dart';
import 'Settings.dart';
import 'DrawerPage.dart';
import 'FormPage.dart';
import 'RequestResponse.dart';
import 'dart:developer' as devtools show log;

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List _pageLIst = [
    HomePage(),
    CategoryPage(),
    RRPage(),
    FormPage(),
    SettingsPage()
  ];
  final List _pageTitle = [
    "Home Page",
    "Category Page",
    "Request and Response",
    "Form Page",
    "Settings Page",
  ];
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: ((context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
              context: context,
              text: state.loadingText ?? 'Please wait a moment...');
        } else {
          LoadingScreen().hide();
        }
      }),
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const HomePage();
          // return _pageLIst[_currentIndex];
        } else if (state is AuthStateNeedsVerification) {
          return VerifyEmailPage();
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil(vepPage, (route) => false);
        } else if (state is AuthStateLoggedOut) {
          return LoginPage();
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil(loginPage, (route) => false);
        } else if (state is AuthStateRegistering) {
          return RegisterPage();
        } else if (state is AuthStateForgotPassword) {
          return ForgotPasswordView();
        } else {
          return Scaffold(
            body: const CircularProgressIndicator(),
          );
        }
        //
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(_pageTitle[_currentIndex]),
    //     actions: [
    //       PopupMenuButton<MenuAction>(
    //         onSelected: (value) async {
    //           switch (value) {
    //             case MenuAction.logout:
    //               final shouldLogout = await showLogOutDialog(context);
    //               if (shouldLogout) {
    //                 await AuthService.firebase().logOut();
    //                 Navigator.of(context)
    //                     .pushNamedAndRemoveUntil('/login', (route) => false);
    //               }
    //               break;
    //             default:
    //           }
    //         },
    //         itemBuilder: (context) {
    //           return const [
    //             PopupMenuItem<MenuAction>(
    //               value: MenuAction.logout,
    //               child: ListTile(
    //                 trailing: Icon(Icons.logout),
    //                 title: Text("Logout"),
    //               ),
    //             ),
    //           ];
    //         },
    //       )
    //     ],
    //   ),
    //   body: FutureBuilder(
    //     future: AuthService.firebase().initialize(),
    //     builder: (context, snapshot) {
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           // TODO: Handle this case.
    //           break;
    //         case ConnectionState.waiting:
    //           // TODO: Handle this case.
    //           break;
    //         case ConnectionState.active:
    //           // TODO: Handle this case.
    //           break;
    //         case ConnectionState.done:
    //           // FirebaseAuth.instance.currentUser?.reload();
    //           final user = AuthService.firebase().currentUser;
    //           if (user != null) {
    //             if (user.isEmailVerified) {
    //               return _pageLIst[_currentIndex];
    //             } else {
    //               return const VerifyEmailPage();
    //             }
    //           } else {
    //             return LoginPage();
    //           }
    //         // Navigator.pushNamedAndRemoveUntil(
    //         //     context, loginPage, (route) => false);
    //         // Navigator.pushNamed(context, "/login");
    //         // return _pageLIst[_currentIndex];
    //         default:
    //           return const CircularProgressIndicator();
    //       }
    //       return const CircularProgressIndicator();
    //     },
    //   ),

    //   // ignore: prefer_const_literals_to_create_immutables
    //   bottomNavigationBar: BottomNavigationBar(
    //       type: BottomNavigationBarType.fixed,
    //       currentIndex: _currentIndex,
    //       onTap: (int index) {
    //         setState(() {
    //           _currentIndex = index;
    //         });
    //       },
    //       iconSize: 32,
    //       fixedColor: Colors.red,
    //       backgroundColor: Colors.blue,
    //       items: const [
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.category), label: "category"),
    //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "R & R"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.table_chart), label: "form"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.settings), label: "settings")
    //       ]),
    //   drawer: DrawerPage(),
    //   endDrawer: Drawer(
    //     child: Text("Right"),
    //   ),
    //   floatingActionButton: Container(
    //     height: 80,
    //     width: 80,
    //     padding: EdgeInsets.all(10),
    //     margin: EdgeInsets.only(top: 5),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(40),
    //       color: Colors.white,
    //     ),
    //     child: FloatingActionButton(
    //       onPressed: () {
    //         setState(() {
    //           _currentIndex = 2;
    //         });
    //       },
    //       child: Icon(Icons.add),
    //     ),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    // );
  }
}

enum MenuAction { logout }

// Future<bool> showLogOutDialog(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Sign Out'),
//           content: const Text('Are you sure want to sign out?'),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(false);
//                 },
//                 child: const Text('Cancel')),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(true);
//                 },
//                 child: const Text('Log out')),
//           ],
//         );
//       }).then((value) => value ?? false);
// }
