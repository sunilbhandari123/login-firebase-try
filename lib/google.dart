import 'package:auth_buttons/auth_buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proj/home.dart';
import 'package:proj/user.dart';

final _firestore = FirebaseFirestore.instance;

class Google extends StatelessWidget {
  const Google({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GoogleAuthButton(
            darkMode: true,
            onPressed: () {
              signInWithGoogle().then((onValue) {
                _firestore
                    .collection('users')
                    .doc('auth')
                    .collection('gusers')
                    .add({
                  'email': email,
                  'image': imageUrl,
                  'name': name,
                });
              }).catchError((e) {
                print(e);
              }).then((onValue) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }).catchError((e) {
                print((e));
              });
            }));
  }
}
