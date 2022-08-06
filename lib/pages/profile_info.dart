// ignore_for_file: prefer_const_constructors

import 'package:bio_maker/component/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Bio-data",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/human.png'),
              ),
              Text('Full name'),
              Text('@username'),
              CustomTextField(),
              CustomTextField(),
              CustomTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
