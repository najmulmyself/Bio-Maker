import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInkWell extends StatelessWidget {
  final title;
  final subtitle;
  final circleAvatarIcon;
  CustomInkWell({this.circleAvatarIcon, this.subtitle, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade200,
            foregroundColor: Colors.black87,
            child: circleAvatarIcon,
          ),
          title: Text(
            title,
            style: GoogleFonts.lato(),
          ),
          subtitle:
              subtitle == '' ? null : Text(subtitle, style: GoogleFonts.lato()),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
