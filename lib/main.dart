// ignore_for_file: prefer_const_constructors

import 'package:bio_maker/pages/registration_page.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Material App',
      home: HomePage(),
      routes: {
        '/login':(context) => LoginScreen(),
        '/registration':(context) => RegistrationScreen()
      },
    );
  }
}
