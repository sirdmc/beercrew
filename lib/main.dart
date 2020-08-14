import 'package:beercrew/screens/cerveza/homebeer.dart';
import 'package:beercrew/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/beer': (context) => HomeBeer(),
        '/home': (context) => HomePage()

      },
      title: 'NOVARIS ECOMMERCE',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: LoginHome(),
    );
  }
}
