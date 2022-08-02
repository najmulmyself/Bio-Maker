// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          
          if(value == currentIndex){
            
          }
          else if (value == 0) {
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CustomInkWell(
                      circleAvatarIcon: FaIcon(FontAwesomeIcons.user),
                      title: 'My Account',
                      subtitle: 'Make changes to your account',
                    ),
                    CustomInkWell(
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
