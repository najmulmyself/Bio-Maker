// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/button.dart';
import '../component/social_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bButton = MainButton(
    bgColor: Colors.black,
    txtColor: Colors.white,
    btnTxt: 'Login',
    route: null,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
            ),
            Text(
              'Welcome back! Glad \n to see you,Again!',
              style: TextStyle(fontSize: 34),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    showCursor: true,
                    cursorColor: Colors.grey.shade400,
                    cursorHeight: 5,
                    decoration: InputDecoration(
                      // labelText: 'dflsadfjlsadkj',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: 'Enter your email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    showCursor: true,
                    cursorColor: Colors.grey.shade400,
                    cursorHeight: 5,
                    decoration: InputDecoration(
                      // labelText: 'dflsadfjlsadkj',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: 'Enter your password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            bButton,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Divider(
                  color: Colors.red,
                  height: 5,
                  thickness: 20,
                ),
                Text('Or login with'),
                Divider(
                  height: 5,
                  color: Colors.black,
                  thickness: 2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.facebookF,
                  // color: Colors.blue.shade700,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.apple,
                  // color: Colors.green,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.google,
                  // color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text('Don\'t have an account ?'),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text('Register now')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
