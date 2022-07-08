import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/auth/auth_exception.dart';
import 'package:untitled/auth/auth_service.dart';
import 'package:untitled/auth/bloc/auth_bloc.dart';
import 'package:untitled/auth/bloc/auth_event.dart';
import 'package:untitled/auth/bloc/auth_state.dart';
import 'package:untitled/pages/dialog/ErrorDialog.dart';
import 'package:untitled/pages/dialog/Loading_dialog.dart';
import '../../routes/Routes.dart';
import '../dialog/GenericDialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _username;
  late final TextEditingController _password;
  CloseDialog? _closeDialogHandle;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateLoggedOut) {
            // final closeDialog = _closeDialogHandle;
            // if (!state.isLoading && closeDialog != null) {
            //   closeDialog();
            //   _closeDialogHandle = null;
            // } else if (state.isLoading && closeDialog == null) {
            //   _closeDialogHandle = showLoadingDialog(
            //     context: context,
            //     text: 'Loading...',
            //   );
            // }
            if (state.exception is UserNotFoundAuthException) {
              await showErrorDialog(
                  context, "Cannot find a user with the entered credentials");
            } else if (state.exception is WrongPasswordAuthException) {
              await showErrorDialog(context, "Wrong Credentials");
            } else if (state.exception is GenericAuthException) {
              await showErrorDialog(context, "Error: Authentication Error");
            }
          }
        },
        child: Scaffold(
            appBar: AppBar(title: const Text("Login Page")),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        autofocus: true,
                        controller: _username,
                        decoration: const InputDecoration(
                            hintText: "Enter Username",
                            label: Text("Username")),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter Password",
                            label: Text("Password")),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final email = _username.text;
                            final password = _password.text;
                            context.read<AuthBloc>().add(AuthEventLogIn(
                                  email,
                                  password,
                                ));
                            // try {

                            //   // await AuthService.firebase()
                            //   //     .logIn(email: email, password: password);

                            //   // final user = AuthService.firebase().currentUser;
                            //   // if (user?.isEmailVerified ?? false) {
                            //   //   Future.delayed(Duration.zero).then((_) {
                            //   //     Navigator.of(context)
                            //   //         .pushNamedAndRemoveUntil('', (route) => false);
                            //   //   });
                            //   // } else {
                            //   //   Future.delayed(Duration.zero).then((_) {
                            //   //     Navigator.of(context)
                            //   //         .pushNamedAndRemoveUntil(vepPage, (route) => false);
                            //   //   });
                            //   // }
                            // }
                            // on UserNotFoundAuthException {
                            //   await showErrorDialog(context, "User not found");
                            // } on WrongPasswordAuthException {
                            //   await showErrorDialog(context, "Wrong Password");
                            // } on GenericAuthException {
                            //   await showErrorDialog(
                            //       context, "Error: Authenication Error");
                            // }
                          },
                          child: const Text("Login")),
                      TextButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEventShouldRegister());
                          },
                          //  Navigator.of(context)
                          //     .pushNamedAndRemoveUntil(
                          //         registerPage, (route) => false)),
                          child: const Text(
                              "Haven't have an account? Register here")),
                      TextButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEventForgotPassword());
                          },
                          //  Navigator.of(context)
                          //     .pushNamedAndRemoveUntil(
                          //         registerPage, (route) => false)),
                          child: const Text("Forgot Password? Click here"))
                    ]),
              ),
            )),
      );
}
