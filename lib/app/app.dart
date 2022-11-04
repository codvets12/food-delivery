import 'package:flutter/material.dart';
import 'package:food_delivery/Routes/routes.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      routes:Routes.myRoutes(context) ,
    );
  }
}
