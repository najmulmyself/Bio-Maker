// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/custom_inkWell.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final auth = FirebaseAuth.instance;
  Future? _signOut() async {
    final user = auth.currentUser?.email;
    print('1: $user');
    await auth.signOut();
    Navigator.pushNamed(context, '/home');
    print('2: $user ');
  }

  @override
  Widget build(BuildContext context) {
    Function? myacc() {
      // Navigator.pushNamed(context, '/login');
      print(auth.currentUser?.email);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: GoogleFonts.signikaNegative(
                  textStyle: TextStyle(fontSize: 25)),
            ),
            Card(
              elevation: 5,
              color: Colors.black87,
              child: InkWell(
                splashColor: Colors.grey.shade400,
                onTap: () {},
                child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 30,
                          child: FaIcon(FontAwesomeIcons.userGraduate),
                        ),
                        title: Text(
                          'Your name here..',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        subtitle: Text(
                          '@username',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        trailing: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5,
              child: SizedBox(
                // height: 400,
                child: Column(
                  children: [
                    CustomInkWell(
                      // onPressed: '/home',
                      onTap: myacc,
                      circleAvatarIcon: FaIcon(FontAwesomeIcons.user),
                      title: 'My Account',
                      subtitle: 'Make changes to your account',
                    ),
                    CustomInkWell(
                      onTap: _signOut,
                      circleAvatarIcon:
                          FaIcon(FontAwesomeIcons.rightFromBracket),
                      title: 'Log out',
                      subtitle: 'Further secure your account for safety',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'More',
              style: GoogleFonts.signikaNegative(
                  textStyle: TextStyle(fontSize: 25)),
            ),
            Card(
              elevation: 5,
              child: SizedBox(
                child: Column(
                  children: [
                    CustomInkWell(
                      circleAvatarIcon: FaIcon(FontAwesomeIcons.bell),
                      title: 'Help & support',
                      subtitle: '',
                    ),
                    CustomInkWell(
                      circleAvatarIcon: FaIcon(FontAwesomeIcons.heart),
                      title: 'About App',
                      subtitle: '',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
