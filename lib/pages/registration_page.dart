// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bio_maker/utils/scaffold_msg.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../component/button.dart';
import '../component/custom_text_field.dart';
import '../component/social_button.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void>? createUser() {
    try {
      final userCredential = FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential != null) {
        final util = Util(text: 'Registration Successfully');
        util.showSnack(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        final util = Util(text: 'Email already in use');
        util.showSnack(context);
      }
    } catch (e) {
      print(e);
    }
  }

  // MainButton bButton = MainButton(
  //   bgColor: Colors.black,
  //   txtColor: Colors.white,
  //   btnTxt: 'Register',
  //   onPressed: createUser(),
  // );
  // final Widget ? bButton;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody:
                false, // should be false , if true; it will overflow content
            // for more head over to this link : https://stackoverflow.com/questions/63844494/singlechildscrollview-column-either-overflow-or-ignore-mainaxisalignment
            child: Padding(
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
                      CustomTextField(
                        text: 'Username',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: 'Email',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: 'Password',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: 'Confirm Password',
                      ),
                    ],
                  ),
                  MainButton(
                    bgColor: Colors.black,
                    txtColor: Colors.white,
                    btnTxt: 'Register',
                    onPressed: createUser(),
                  ),
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
                      Text('Already have an account ?'),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text('Login now')),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
