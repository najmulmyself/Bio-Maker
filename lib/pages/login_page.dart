// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_catch_clause

import 'package:bio_maker/component/custom_text_field.dart';
import 'package:bio_maker/utils/scaffold_msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../component/button.dart';
import '../component/social_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // final bButton = MainButton(
  //   bgColor: Colors.black,
  //   txtColor: Colors.white,
  //   btnTxt: 'Login',
  //   onPressed: null,
  // );

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    print(googleUser?.photoUrl);

    // final signOut = GoogleSignIn().signOut();
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(credential);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void>? login() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        final util = Util(
            bgColor: Colors.green,
            text: 'Login successful',
            txtColor: Colors.white);
        util.showSnack(context);
      }).then(
        (value) => Navigator.pushNamed(context, '/login-success'),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Util(
          bgColor: Colors.red,
          txtColor: Colors.white,
          text: 'Wrong password',
        ).showSnack(context);
      } else if (e.code == 'user-not-found') {
        Util(
          bgColor: Colors.red,
          txtColor: Colors.white,
          text: 'User not found',
        ).showSnack(context);
      }
    } catch (e) {
      print(e);
    }
    final auth = FirebaseAuth.instance;
    print('loginPage: ${auth.currentUser}');
  }

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
              style: GoogleFonts.signikaNegative(
                textStyle: TextStyle(fontSize: 34),
              ),
            ),
            Column(
              children: [
                CustomTextField(
                  controller: email,
                  text: 'Enter your email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: password,
                  text: 'Enter your password',
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forget Password',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MainButton(
              bgColor: Colors.black,
              txtColor: Colors.white,
              btnTxt: 'Login',
              onPressed: login,
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
                Text(
                  'Or login with',
                  style: GoogleFonts.lato(),
                ),
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
                Text(
                  'Don\'t have an account ?',
                  style: GoogleFonts.lato(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 15,
                    color: Colors.black,
                    child: Text('Register now',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.white),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
