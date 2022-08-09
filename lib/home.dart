// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:proj/user.dart';

 class Home extends StatefulWidget {
 
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          signOutGoogle();
          Navigator.pop(context);
        },
        child: const Text("Sign Out"),
        color: Colors.brown,);
  }
}
  

