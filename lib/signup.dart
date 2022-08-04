import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  late String email;

  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
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
          const SizedBox(height: 20),
          FlatButton(
            onPressed: (() async {
              try {
                final newuser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newuser != null) {
                  Navigator.pushNamed(context, '/Home');
                }
              } catch (e) {
                print(e);
              }
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
