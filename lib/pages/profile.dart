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
              elevation: 5,
              color: Colors.black87,
              child: InkWell(
                splashColor: Colors.grey.shade400,
                onTap: () {},
                child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                        title: Text(
                          'Your name here..',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '@username',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5,
              child: SizedBox(
                height: 400,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    InkWell(
                      splashColor: Colors.grey,
                      onTap: () {},
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text('My Account'),
                        subtitle: Text('make changes to your account'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
