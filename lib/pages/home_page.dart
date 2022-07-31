// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../component/button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void loginScreen() {
      Navigator.pushNamed(context, '/login');
    }

    void registrationScreen() {
      Navigator.pushNamed(context, '/registration');
    }

    final bButton = MainButton(
      bgColor: Colors.black,
      txtColor: Colors.white,
      btnTxt: 'Login',
      onPressed: loginScreen,
    );
    final tButton = MainButton(
      bgColor: Colors.transparent,
      txtColor: Colors.black,
      btnTxt: 'Register',
      onPressed: registrationScreen,
    );

    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
          // SizedBox(
          //   height: 20,
          // ),
          tButton,
        ],
      ),
    ));
  }
}
