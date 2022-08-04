import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              }),
          TextField(
            decoration: const InputDecoration(labelText: "Password"),
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            obscureText: true,
          ),
          const SizedBox(height: 80),
          FlatButton(
            onPressed: (() {}),
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.brown,
          ),
          const SizedBox(height: 20),
          FlatButton(
            onPressed: (() {
              Navigator.pushNamed(context, '/SignUp');
            }),
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.brown,
          )
        ]));
  }
}
