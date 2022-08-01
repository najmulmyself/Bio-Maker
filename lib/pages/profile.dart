// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile'),
            Card(
              color: Colors.black87,
              child: InkWell(
                splashColor: Colors.grey.shade400,
                onTap: () {},
                child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text('Your name'),
                        subtitle: Text('@username'),
                        trailing: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
