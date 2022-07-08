import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/auth/auth_exception.dart';
import 'package:untitled/auth/auth_service.dart';
import 'package:untitled/auth/bloc/auth_bloc.dart';
import 'package:untitled/auth/bloc/auth_event.dart';
import 'package:untitled/auth/bloc/auth_state.dart';
import 'package:untitled/pages/dialog/ErrorDialog.dart';
import 'package:untitled/routes/Routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _username;
  late final TextEditingController _password;
  int _gender = 1;
  List _hobby = [
    {"checked": false, "title": "eat"},
    {"checked": false, "title": "coding"},
    {"checked": false, "title": "sleep"}
  ];

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  List<Widget> _getHobby() {
    List<Widget> tempList = [];
    for (int i = 0; i < _hobby.length; i++) {
      tempList.addAll([
        Text(_hobby[i]["title"]),
        Checkbox(
            value: _hobby[i]["checked"],
            onChanged: (value) {
              setState(() {
                _hobby[i]["checked"] = value;
              });
            })
      ]);
    }
    return tempList;
  }

  void _setGender(value) => setState(() {
        _gender = value as int;
      });
  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateRegistering) {
            if (state.exception is WeakPasswordAuthException) {
              await showErrorDialog(context, "Weak Password");
            } else if (state.exception is EmailAlreadyInUseAuthException) {
              await showErrorDialog(context, "Email is already in use");
            } else if (state.exception is GenericAuthException) {
              await showErrorDialog(context, "Failed to register");
            } else if (state.exception is InvalidEmailAuthException) {
              await showErrorDialog(context, "Invalid email");
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Register Page")),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _username,
                    decoration: const InputDecoration(
                        label: Text("Username"), hintText: "Enter username"),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        label: Text("Password"), hintText: "Enter password"),
                  ),
                  Row(
                    children: [
                      const Text("Male"),
                      Radio(
                          value: 1,
                          groupValue: _gender,
                          onChanged: (value) => _setGender(value)),
                      const Text("Female"),
                      Radio(
                          value: 2,
                          groupValue: _gender,
                          onChanged: (value) => _setGender(value)),
                    ],
                  ),
                  ListTile(
                    title: const Text("Hobby"),
                    subtitle: Row(
                      children: _getHobby(),
                    ),
                  ),
                  const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: "enter something ...",
                        label: Text("Description"),
                        border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        // await Firebase.initializeApp(
                        //     options: DefaultFirebaseOptions.currentPlatform);
                        final email = _username.text;
                        final password = _password.text;
                        context.read<AuthBloc>().add(AuthEventRegister(
                              email,
                              password,
                            ));
                        // try {
                        //   await AuthService.firebase()
                        //       .createUser(email: email, password: password);
                        //   // final user = AuthService.firebase().currentUser;
                        //   await AuthService.firebase().sendEmailVerification();
                        //   Future.delayed(Duration.zero).then(
                        //       (_) => Navigator.of(context).pushNamed(loginPage));
                        // } on WeakPasswordAuthException {
                        //   await showErrorDialog(context, "Weak Password");
                        // } on EmailAlreadyInUseAuthException {
                        //   await showErrorDialog(
                        //       context, "Email is already in use");
                        // } on InvalidEmailAuthException {
                        //   await showErrorDialog(context, "Invalid email entered");
                        // } on GenericAuthException {
                        //   await showErrorDialog(
                        //       context, "Error: Authenticate Error");
                        // }
                      },
                      child: const Text("Submit")),
                  TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(const AuthEventLogOut());
                      },
                      // Navigator.of(context)
                      //     .pushNamedAndRemoveUntil(loginPage, (route) => false),
                      child: const Text("Already have an account? Login here"))
                ],
              ),
            ),
          ),
        ),
      );
}
