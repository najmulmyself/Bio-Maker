// ignore_for_file: prefer_const_constructors

import 'package:bio_maker/component/login_success.dart';
import 'package:bio_maker/pages/profile.dart';
import 'package:bio_maker/pages/profile_info.dart';
import 'package:bio_maker/pages/registration_page.dart';
import 'package:bio_maker/pages/user_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      // initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/user-page': (context) => UserPage(),
        '/profile': (context) => Profile(),
        '/login-success': (context) => LoginSuccess(),
        '/profile-info': (context) => ProfileInfo()
      },
    );
  }
}
