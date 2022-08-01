import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  final bgColor;
  final txtColor;
  final btnTxt;
  final onPressed;
  MainButton({this.bgColor, this.txtColor, this.btnTxt, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
        child: Text(btnTxt,
            style: GoogleFonts.lato(textStyle: TextStyle(color: txtColor))),
      ),
    );
  }
}
