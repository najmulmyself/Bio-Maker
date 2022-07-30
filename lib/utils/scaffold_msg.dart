import 'package:flutter/material.dart';

class Util {
  final String? text;
  Util({this.text});
  void showSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text!),
      ),
    );
  }
}
