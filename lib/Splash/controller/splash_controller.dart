import 'package:get/get.dart';

import '../../Routes/routes.dart';

class SplashController extends GetxController {
  bool ischecked = false;
  Future<void> splashInit() async {
    await Future.delayed(const Duration(seconds: 1), () {
      Get.off(Routes.loginscreen);
    });
  }

  Future<void> checkbox() async {}
}
