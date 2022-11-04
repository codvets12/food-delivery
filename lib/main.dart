import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Splash/controller/splash_controller.dart';
import 'package:food_delivery/provider/seller_provider.dart';

import 'package:provider/provider.dart';

import 'app/app.dart';
import 'network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ChangeNotifierProvider(create: (context) => SplashProvider()),
      ChangeNotifierProvider(create: (context) => SellerProvider())
    ],
    child: MyApp(),
  ));
}
