// ignore_for_file: prefer_const_constructors

import 'package:bio_maker/component/custom_text_field.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                text: 'What\'s your first name ?',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(text: 'And your last name ?'),
              SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 2.5, color: Colors.black)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                ),
                initialCountryCode: 'BAN',
              ),
              SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              DropdownButton(items: [
                DropdownMenuItem(
                  child: Text('Male'),
                  value: Text('Male'),
                ),
                DropdownMenuItem(
                  child: Text('Female'),
                  value: Text('Female'),
                ),
              ], onChanged: null)
            ],
          ),
        ),
      ),
    );
  }
}
