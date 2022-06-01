import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Auth/controller/auth_controller.dart';
import 'package:get/get.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  log("bug is in firebase initialieapp");
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(MyApp());
}
