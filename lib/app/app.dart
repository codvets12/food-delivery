import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Routes/routes.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../Splash/controller/splash_controller.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SplashController controller = Get.put(SplashController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: Routes.getPages,
    );
  }
}
