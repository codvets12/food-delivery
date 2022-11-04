import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/authenticationscreen/login.dart';


class SplashProvider with ChangeNotifier {
  bool ischecked = false;
  Future<void> splashInit(context) async {
    await Future.delayed(const Duration(seconds: 1), () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    LoginScreen()
   
    ));
    });
  }

  Future<void> checkbox() async {}
}
