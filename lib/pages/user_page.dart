// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Stream userStream =
      FirebaseFirestore.instance.collection('users').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      // body: Center(
      //   child: Text('Users list will be shown here....'),
      // ),
      body: StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Snapshot from hasError : $snapshot');
            return Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Snapshot from connectionState : ${snapshot.data}');
            return Text('Data loading');
          }
          return ListView(
            children: [Text('${snapshot.data}'), Text('${snapshot.data}')],
          );
        },
      ),
    );
  }
}
