import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';

import '../widgets/submit_button.dart';
import 'homepage/homepage.dart';

class HandleSignIn extends StatefulWidget {
  const HandleSignIn({Key? key}) : super(key: key);

  @override
  State<HandleSignIn> createState() => _HandleSignInState();
}

TextEditingController nameController = TextEditingController();
TextEditingController feesController = TextEditingController();
String std = '';
String dropdownvalue = 'Regular';
int fees = 0;
final db = FirebaseFirestore.instance;
final uid = FirebaseAuth.instance.currentUser?.uid;

// List of items in our dropdown menu
var items = [
  'Regular',
  'Engineering',
  'Medical',
];

class _HandleSignInState extends State<HandleSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: kTypicalCardDecor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                'Enter Details',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kHeadingColor),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    focusColor: kOrangeColor,
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xff9C9C9C),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: feesController,
                  decoration: const InputDecoration(
                    focusColor: kOrangeColor,
                    hintText: 'Enter fees paid Eg "30000"',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Color(0xff9C9C9C),
                    ),
                  ),
                ),
              ),
              CustomSubmitButton(
                ontapFunction: () {
                  FirebaseAuth.instance.currentUser
                      ?.updateDisplayName(nameController.text);

                  final userdata = <String, String>{
                    'uid': uid!,
                    'name': nameController.text,
                  };

                  db.collection('teachers').doc(uid).set(userdata).onError(
                      (error, stackTrace) =>
                          print("Error writing document: $error"));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
