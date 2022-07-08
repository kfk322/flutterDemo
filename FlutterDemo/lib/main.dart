// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/auth/bloc/auth_bloc.dart';
import 'package:untitled/auth/firebase_auth_provider.dart';
import 'package:untitled/pages/Home.dart';
import 'package:untitled/pages/Tabs.dart';
import 'routes/Routes.dart';
import 'dart:developer' as devtools show log;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const Tabs(),
      ),
      //routes: routes,
      // initialRoute: "/",
      // onGenerateRoute: onGenerateRoute,
      routes: routes,
    );
  }
}
