import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';



class UserData {
  final String uid;
  final String name;


  UserData({required this.uid, required this.name});
}

// final UserData tejas = UserData(uid: uid, std: std, batch: batch, feespaid: feespaid, name: name)