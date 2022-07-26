// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../component/button.dart';

class HomePage extends StatelessWidget {
  final bButton = MainButton(
    bgColor: Colors.black,
    txtColor: Colors.white,
    btnTxt: 'Login',
  );
  final tButton = MainButton(
    bgColor: Colors.transparent,
    txtColor: Colors.black,
    btnTxt: 'Register',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bButton,
        SizedBox(
          height: 20,
        ),
        tButton,
      ],
    ));
  }
}
