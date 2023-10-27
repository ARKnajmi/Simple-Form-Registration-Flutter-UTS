import 'package:flutter/material.dart';
import 'package:flutter_uts/formregistration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Application',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: formRegistration(),
    );
  }
}
