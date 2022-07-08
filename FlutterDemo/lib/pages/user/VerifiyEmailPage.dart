import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/auth/auth_exception.dart';
import 'package:untitled/auth/auth_service.dart';
import 'package:untitled/auth/bloc/auth_bloc.dart';
import 'package:untitled/auth/bloc/auth_event.dart';
import 'package:untitled/pages/dialog/ErrorDialog.dart';
import 'package:untitled/pages/dialog/GenericDialog.dart';
import 'package:untitled/routes/Routes.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Verify Email")),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const Text(
                  "We've sent you an email verification. Please open it to verify your account.  "),
              const Text(
                  "If you haven't received a verification email yet, press the button below"),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(const AuthEventSendEmailVerification());
                    // try {
                    //   await AuthService.firebase().sendEmailVerification();
                    // } on GenericAuthException {
                    //   await showErrorDialog(context, "Error: Authenticate Error");
                    // }
                  },
                  child: const Text("Send verification email...")),
              TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(const AuthEventLogOut());
                    // await AuthService.firebase().logOut();
                    // Future.delayed(Duration.zero).then((_) =>
                    //     Navigator.of(context).pushNamedAndRemoveUntil(
                    //         registerPage, (route) => false));
                  },
                  child: const Text("Restart"))
            ],
          )),
        ),
      );
}
