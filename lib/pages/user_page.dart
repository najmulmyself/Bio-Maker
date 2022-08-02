// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            Navigator.pushNamed(context, '/user-page');
          } else if (value == 1) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        elevation: 0,
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
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Center(
        child: Text('Users list will be shown here....'),
      ),
    );
  }
}
