import 'package:flutter/material.dart';
import 'package:proj/google.dart';
import 'package:proj/home.dart';
import 'package:proj/login.dart';
import 'package:proj/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const Google(),
      routes: {
        '/Google': (context) => Home(),
       //'/Home': (_) => const Google()
      },
    );
  }
}

