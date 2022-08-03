// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bio_maker/pages/profile.dart';
import 'package:bio_maker/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginSuccess extends StatefulWidget {
  LoginSuccess({Key? key}) : super(key: key);

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  int _currentIndex = 0;
  final screens = [
    UserPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        selectedFontSize: 15,
        // unselectedItemColor: Colors.yellow,
        currentIndex: _currentIndex,
        onTap: (value) {
          
          setState(() {
            _currentIndex = value;
          });
        },
        elevation: 1,
        // selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
