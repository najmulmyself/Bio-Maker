// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../component/button.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: Colors.grey.shade400,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
          Text('Welcome back! Glad \n to see you,Again!'),
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
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                margin: EdgeInsets.only(right: 20, top: 10),
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
          )
        ],
      ),
    );
  }
}
