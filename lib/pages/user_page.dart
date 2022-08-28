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
  String? firstName;
  String? lastName;
  String? userPhone;
  String ? userBirthday;
  String ? userGender;

  getData() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection('users').get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      // body: Center(
      //   child: Text('Users list will be shown here....'),
      // ),
      body: FutureBuilder(
          future: getData(), //this function should return something
          builder: (context, AsyncSnapshot snapshot) {
            // IF ASYNCSNAPSHOT DONT USE NULL ERROR HAPPEND ON SNAPSHOT.DATA
            // if (snapshot != null) {
            return snapshot.data != null
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      DocumentSnapshot data = snapshot.data[index];

                      setState(() {
                        firstName = data['FirstName'];
                        lastName = data['LastName'];
                        userPhone = data['Phone'];
                        userGender = data['Gender'];
                        userBirthday = data['Birthday'];
                      });

                      return ListTile(
                        // leading: Text(data['BirthDate']),
                        title: Text(data['FirstName'] + ' ' + data['LastName']),
                        subtitle: Text(data['Phone']),
                        trailing: Text(data['Gender']),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }
          // },
          ),
    );
  }
}
