// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:bio_maker/utils/scaffold_msg.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/button.dart';
import '../component/custom_text_field.dart';
import '../component/social_button.dart';

import 'package:google_sign_in/google_sign_in.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final signOut = GoogleSignIn().signOut();
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void>? createUser() async {
    try {
      if (passwordController.text == conPasswordController.text) {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        if (userCredential != null) {
          final util = Util(
              text: 'Registration Successful',
              bgColor: Colors.green,
              txtColor: Colors.white);
          util.showSnack(context);
          Navigator.pushNamed(context, '/login');
        }
      } else {
        final util = Util(
            text: "Password did not match",
            bgColor: Colors.red,
            txtColor: Colors.white);
        util.showSnack(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        final util = Util(
          text: 'Email already in use',
          bgColor: Colors.red,
          txtColor: Colors.white,
        );
        util.showSnack(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => print('logout successful'));
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
    return Scaffold(
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
                  style: GoogleFonts.signikaNegative(
                    textStyle: TextStyle(fontSize: 34),
                  ),
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
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      text: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: conPasswordController,
                      text: 'Confirm Password',
                    ),
                  ],
                ),
                MainButton(
                  bgColor: Colors.black,
                  txtColor: Colors.white,
                  btnTxt: 'Register',
                  onPressed: createUser,
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
                    Text('Or login with', style: GoogleFonts.lato()),
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
                      onPressed: _signOut,
                      icon: FontAwesomeIcons.apple,
                      // color: Colors.green,
                    ),
                    SocialButton(
                      onPressed: () {
                        signInWithGoogle().then(
                          (value) {
                            Navigator.pushNamed(context, '/profile');
                          },
                        );
                      },
                      icon: FontAwesomeIcons.google,
                      // color: Colors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text('Already have an account ?',
                        style: GoogleFonts.lato()),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 15,
                          color: Colors.black,
                          child: Text('Login now',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.white),
                              )),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
