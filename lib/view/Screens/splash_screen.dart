import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/splash_controller.dart';
import 'package:get/get.dart';

import '../../Routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());
  // @override
  // void initState() {
  //   Get.find<SplashController>().splashInit();
  //   Get.offNamed(Routes.homeScreen);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.find<SplashController>().splashInit();
      Get.offNamed(Routes.loginscreen);
    });
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash.png"), fit: BoxFit.cover)),
    );
  }
}
