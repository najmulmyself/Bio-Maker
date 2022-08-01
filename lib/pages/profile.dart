// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Profile'),
          Card(
            color: Colors.black,
            child: InkWell(
              splashColor: Colors.grey.shade400,
              onTap: () {},
              child: Container(
                height: 100,
                width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
