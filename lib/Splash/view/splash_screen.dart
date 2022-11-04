
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../screens/authenticationscreen/login.dart';
import '../../screens/check.dart';
import '../../screens/productscreen/Screens/product_show.dart';
import '../../screens/sellerscreen/seller_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
 
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
   
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  CheckScreen()));
    });
    return  
    Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash.png"), fit: BoxFit.cover)),
    );
  }
}


