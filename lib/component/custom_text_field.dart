import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final String? initValue;
  TextEditingController? controller;
  CustomTextField({this.controller, this.text,this.initValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(),
      child: TextFormField(
        initialValue: initValue,
        controller: controller,
        showCursor: true,
        cursorColor: Colors.grey.shade400,
        cursorHeight: 5,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(width: 2.5, color: Colors.black)),
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          hintText: text,
          hintStyle: GoogleFonts.lato(),
          // border: InputBorder.none,

          // FOLLOWING CODE IS USED TO CREATE A BORDER OF A TEXTFIELD, WITHOUT FOCUS

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
