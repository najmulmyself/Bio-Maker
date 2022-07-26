import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 20),
          //   height: 50,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.grey.shade400),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(8),
          //     ),
          //     color: Colors.white10,
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //     child: TextField(
          //       decoration: InputDecoration(
          //         // focusedBorder: OutlineInputBorder(
          //         //   borderSide: const BorderSide(color: Colors.red, width: 0),
          //         //   borderRadius: BorderRadius.circular(25.0),
          //         // ),
          //         border: InputBorder.none,
          //       ),
          //     ),
          //   ),
          // )
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
              decoration: InputDecoration(
                border: InputBorder.none,
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(8),
                //   ),
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
