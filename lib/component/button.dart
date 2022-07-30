import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final bgColor;
  final txtColor;
  final btnTxt;
  final onPressed;
  MainButton({this.bgColor, this.txtColor, this.btnTxt, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: onPressed,
        child: Text(
          btnTxt,
          style: TextStyle(color: txtColor),
        ),
      ),
    );
  }
}
