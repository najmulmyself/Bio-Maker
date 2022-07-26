// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../component/button.dart';

class HomePage extends StatelessWidget {
  final bButton = MainButton(
    bgColor: Colors.black,
    txtColor: Colors.white,
    btnTxt: 'Login',
    route: loginscreen,
  );
  final tButton = MainButton(
    bgColor: Colors.transparent,
    txtColor: Colors.black,
    btnTxt: 'Register',
  );

  @override
  Widget build(BuildContext context) {
      void loginScreen() {
      Navigator.pushNamed(context, '/login');
    }
    void registrationScreen() {
      Navigator.pushNamed(context, '/registration');
    }
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: 250,
          image: AssetImage('assets/images/human.png'),
        ),
        SizedBox(
          height: 20,
        ),
        bButton,
        SizedBox(
          height: 20,
        ),
        tButton,
      ],
    ));
  }
}
