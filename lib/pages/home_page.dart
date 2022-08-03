// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../component/button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // Future<void> initState() async {
  //   super.initState();
  //   final user = await FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     Navigator.pushNamed(context, '/registration');
  //   } else {
  //     // Navigator.pushNamed(context, '/registration');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    isLoggedIn(); // NEED TO CALL SEPERATE FUNCTION BCZ INITS CANT BEAR ASYNC
  }

  Future? isLoggedIn() async {
    final auth = await FirebaseAuth.instance;
    if (auth.currentUser != null) {
      Navigator.pushNamed(context, '/login-success');
    }
  }

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
