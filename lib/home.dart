// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:proj/user.dart';

 class Home extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          signOutGoogle();
          Navigator.pop(context);
        },
        child: Text("Sign Out"));
  }
  

  }
  

