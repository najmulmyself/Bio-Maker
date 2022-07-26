import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final bgColor;
  final txtColor;
  final btnTxt;
  MainButton({this.bgColor, this.txtColor, this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        width: double.infinity,
        child: MaterialButton(
          onPressed: null,
          child: Text(
            btnTxt,
            style: TextStyle(color: txtColor),
          ),
        ),
      ),
    );
  }
}
