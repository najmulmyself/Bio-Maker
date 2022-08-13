// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bio_maker/component/button.dart';
import 'package:bio_maker/component/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jiffy/jiffy.dart';

class ProfileInfo extends StatefulWidget {
  // final uid;
  ProfileInfo();
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  // var uid = widget.uid;
  // Function? getUid() {
  //   final auth = FirebaseAuth.instance;
  //   uid = auth.currentUser?.uid;
  //   return uid;
  // }

  @override
  void initState() {
    // TODO: implement initState

    // getUid();
  }

  String? selectedItem = 'Male';

  var items = ['Male', 'Female'];

  var selectedDate;

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? gender;
  String? birthDate;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController phone = TextEditingController();

  String? uid;

  Function ? getUid() {
    final auth = FirebaseAuth.instance;
    uid = auth.currentUser?.uid;
    return uid;
  }

  DocumentReference users =
      FirebaseFirestore.instance.collection('users').doc();

  Future<void>? addProfile() {
    firstName = fName.text;
    lastName = lName.text;
    phoneNumber = phone.text;

    return users
        .set({
          'FirstName': firstName,
          'LastName': lastName,
          'Phone': phoneNumber,
          'Gender': selectedItem,
          'BirthDate': parsingDate(),
        })
        .then((value) => print('PROFILE ADDED SUCCESSFULLY'))
        .catchError((err) => print(err));
  }

  parsingDate() {
    return Jiffy(selectedDate).format("MMMM do yyyy");
  }

  @override
  Widget build(BuildContext context) {
    final parsedDate = parsingDate();

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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/human.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Full name',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Text(
                    '@username',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: fName,
                    text: 'What\'s your first name ?',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    text: 'And your last name ?',
                    controller: lName,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IntlPhoneField(
                    controller: phone,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      hintStyle: GoogleFonts.lato(),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(width: 2.5, color: Colors.black)),
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
                    initialCountryCode: 'BD',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border:
                          Border.all(width: 0.9, color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      // WIDGET FOR HIDING UNDERLINE IN DROPDOWNBTN
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton(
                            // value: '',
                            hint: Text(
                              'Select your gender',
                              style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                            value: selectedItem,
                            items: items.map(
                              (item) {
                                return DropdownMenuItem(
                                  child: Text(
                                    item,
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade700)),
                                  ),
                                  value: item,
                                );
                              },
                            ).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedItem = value;
                              });
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        locale: LocaleType.en,
                        showTitleActions: true,
                        theme: DatePickerTheme(
                          doneStyle: TextStyle(color: Colors.black),
                          itemStyle: TextStyle(color: Colors.black),
                        ),
                        // onChanged: null,
                        onConfirm: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                        onCancel: null,
                        onChanged: (date) {
                          setState(() {
                            date;
                          });
                        },
                        // currentTime: DateTime.now(),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border:
                            Border.all(width: 0.9, color: Colors.grey.shade700),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate == null
                                ? 'What is your date of birth ?'
                                : parsedDate.toString(),
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(color: Colors.grey.shade700)),
                          ),
                          Icon(Icons.calendar_month_rounded)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MainButton(
                    bgColor: Colors.black,
                    txtColor: Colors.white,
                    btnTxt: 'Update profile',
                    onPressed: addProfile,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
