import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../component/button.dart';
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
    } on FirebaseAuthException catch (e) {
      if(e.code == 'email-already-in-use'){
        
      }
    } catch (e) {
      print(e);
    }
  }

  final bButton = MainButton(
    bgColor: Colors.black,
    txtColor: Colors.white,
    btnTxt: 'Register',
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
                      hintText: 'Username',
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
                    controller: emailController,
                    showCursor: true,
                    cursorColor: Colors.grey.shade400,
                    cursorHeight: 5,
                    decoration: InputDecoration(
                      // labelText: 'dflsadfjlsadkj',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: 'Email',

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
                    controller: passwordController,
                    showCursor: true,
                    cursorColor: Colors.grey.shade400,
                    cursorHeight: 5,
                    decoration: InputDecoration(
                      // labelText: 'dflsadfjlsadkj',
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: 'Password',
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
                      hintText: 'Confirm Password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 10),
                //   alignment: AlignmentDirectional.centerEnd,
                //   child: Text(
                //     'Forget Password',
                //     style: TextStyle(
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
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
    );
  }
}
