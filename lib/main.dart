import 'package:flutter/material.dart';
import 'apps/loginpage/loginpage.dart';
import 'apps/landingpage/landingpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeloForRent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',),
      initialRoute: '/landingpage',
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/landingpage': (context) => LandingPage(),
      },
    );
  }
}
