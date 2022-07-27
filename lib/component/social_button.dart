import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  final icon;
  final color;
  SocialButton({this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey, width: 1.7),
      ),
      child: IconButton(
        icon: FaIcon(
          icon,
          size: 30,
          color: Colors.black,
        ),
        // size: 45,
        onPressed: null,
      ),
    );
  }
}
