import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/Screens/cart.dart';
import '../view/Screens/credit_card.dart';
import '../view/Screens/first.dart';
import '../view/Screens/food_detail_screen.dart';
import '../view/Screens/location_screen.dart';
import '../view/Screens/login.dart';
import '../view/Screens/order_complete_screen.dart';
import '../view/Screens/register.dart';
import '../view/Screens/splash_screen.dart';

class Routes {
  static const String splashScreen = "/splashScreen";
  static const String loginscreen = "/LoginScreen";
  static const String registerscreen = "/RegisterScreen";
  static const String firstscreen = "/FirstScreen";
  static const String cartscreen = "/CartScreen";
  static const String creditcardscreen = "/CreditCard";
  static const String fooddetailscreen = "/FoodDetailScreen";
  static const String locationscreen = "/LocationScreen";
  static const String ordercompletescreen = "/OrderCompleteScreen";
  static List<GetPage> getPages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: loginscreen,
      page: () => const LoginScreen(),
    ),
    GetPage(name: registerscreen, page: () => RegisterScreen()),
    GetPage(name: firstscreen, page: () => FirstScreen()),
    GetPage(name: cartscreen, page: () => CartScreen()),
    GetPage(name: creditcardscreen, page: () => CreditCard()),
    GetPage(name: fooddetailscreen, page: () => FoodDetailScreen()),
    GetPage(name: locationscreen, page: () => LocationScreen()),
    GetPage(name: ordercompletescreen, page: () => OrderCompleteScreen())
    // GetPage(
    //   name: createFeedScreen,
    //   page: () => CreateFeedScreen(),
    // ),
  ];
}
