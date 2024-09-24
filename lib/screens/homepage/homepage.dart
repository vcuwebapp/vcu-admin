import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vcuadmin/constants.dart';
import 'package:vcuadmin/models/userdata.dart';

import 'cta/ctas.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

UserData? userData;

class _HomePageState extends State<HomePage> {
  final docRef = FirebaseFirestore.instance
      .collection("admin")
      .doc(FirebaseAuth.instance.currentUser?.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: kHeadingColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ],
            )
          ],
        ),
      ),
      body: FutureBuilder(
          future: docRef.get().then(
            (DocumentSnapshot doc) {
              final data = doc.data() as Map<String, dynamic>;
              userData = UserData(
                uid: data['uid'],
                name: data['name'],
              );
            },
            onError: (e) => print("Error getting document: $e"),
          ),
          builder: (_, snapshot) {
            if (userData != null) {
              return SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      CTAS(
                        userData: userData!,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
