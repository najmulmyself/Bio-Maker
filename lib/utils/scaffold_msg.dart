import 'package:flutter/material.dart';

class Util {
  Color? bgColor;
  Color? txtColor;
  final String? text;
  Util({this.text, this.bgColor, this.txtColor});
  void showSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          text!,
          style: TextStyle(
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
