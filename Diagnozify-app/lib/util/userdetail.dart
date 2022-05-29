// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userDetail(String Username, int Age, String Gender) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  users.add({
    'Username': Username,
    'Age': Age,
    'Gender': Gender,
    'email': auth.currentUser!.email,
    'profile_img': '',
    'syndrome': 'null'
  });
}
