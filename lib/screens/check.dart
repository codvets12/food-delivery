import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/network.dart';
import 'package:food_delivery/screens/authenticationscreen/login.dart';
import 'package:food_delivery/screens/productscreen/Screens/product_show.dart';
import 'package:food_delivery/screens/sellerscreen/seller_home.dart';
import 'package:provider/provider.dart';

import '../Routes/routes.dart';
import '../model/user_model.dart';

class CheckScreen extends StatefulWidget {
  CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map data = {};

  checkCurrentUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    try {
      if (firebaseUser != null) {
        print(firebaseUser.uid);
        final documentSnapshot =
            await firestore.collection("users").doc(firebaseUser.uid).get();
        print(documentSnapshot);
        if (documentSnapshot.exists) {
          final data = documentSnapshot.data()!;
          log(data.toString());

          if (data['usertype'] == 'seller') {
            Navigator.pushNamed(context, Routes.sellerhomescreen);
          } else {
            Navigator.pushNamed(context, Routes.productshowscreen);
          }
          return data;
        }
      }
    } on FirebaseException catch (error, stk) {
      throw error;
    }
  }

  // finduser(User? user) async {
  //   final documentsnapshot =
  //       await firestore.collection("users").doc(user!.uid).get();

  //   data = documentsnapshot.data()!;
  //   log("its data user ");
  //   log(data.toString());
  //   return data;
  // }

  @override
  void initState() {
    checkCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (data.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (data['usertype'] == 'seller') {
              return ProductEntry();
            } else {
              return const ProductShowScreen();
            }
          }

          //return const ProductShowScreen();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          log(snapshot.hasError.toString());
          return const Text("Some error occur");
        } else {
          return const LoginScreen();
        }
      }),
    );
  }
}
