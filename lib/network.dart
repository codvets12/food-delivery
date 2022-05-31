import 'dart:developer';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Auth/model/user_model.dart';

class Network {
  final firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseFirestore storage = FirebaseFirestore.instance;

  String get uid => firebaseAuth.currentUser!.uid;
  Future<UserModel> Register({
    required UserModel model,
    required String password,
  }) async {
    try {
      log("network class");

      final UserCredential creds =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: model.email,
        password: password,
      );
      log("second network class");

      model.uid = creds.user!.uid;
      print(model.uid);
      await firestore
          .collection("users")
          .doc(creds.user!.uid)
          .set(model.tojson());
      log(model.email);
      log(model.uid!);
      log("third network class");

      return model;
    } on FirebaseAuthException catch (e) {
      print("its error on register in network class");
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> Login({required String password, required String email}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      log("second login class");
    } on FirebaseAuthException catch (e) {
      log("third network");
      print("error in Login  in network class ");
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
