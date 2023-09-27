import 'package:flutter/material.dart';
import 'pages/Login/Login.dart';
import 'pages/tags/Tags.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/tags': (context) => const Tags(),
        '/login': (context) => const Login(),
      },
      home: const Scaffold(body: Tags()),
    );
  }
}
