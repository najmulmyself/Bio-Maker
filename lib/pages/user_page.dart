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
  // Stream userStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();

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
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          // IT IS IMPORTANT TO ADD ASYNCSNAPSHOT, OTHERWISE DOCS WONT BE KNOWN
          if (snapshot.hasError) {
            print('Snapshot from hasError : $snapshot');
            return Text('something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Snapshot from connectionState : ${snapshot.data}');
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            print('done state: ${snapshot.data}');
            // return ListView(
            //   children:
            //       snapshot.data.documents.map((DocumentSnapshot document) {
            //     print('fooooo : $document');
            //   }),
            // );
            return ListView();
          }
          // return ListView(
          //   children: [],
          //   // children: snapshot.data!.docs.map(
          //   //   (DocumentSnapshot document) {
          //   //     Map<String, dynamic> data =
          //   //         document.data()! as Map<String, dynamic>;
          //   //     // return ListTile(
          //   //     //   title: Text(data['FirstName']),
          //   //     //   subtitle: Text(data['LastName']),
          //   //     // );
          //   //   },
          //   // ).toList(),
          // );
          return Text('Done');
          // },
          // ;
        },
      ),
    );
  }
}
