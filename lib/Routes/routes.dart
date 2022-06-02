import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Auth/view/login.dart';
import '../Auth/view/register.dart';
import '../Auth/view/resert_password.dart';
import '../Product/view/Screens/cart.dart';
import '../Product/view/Screens/credit_card.dart';

import '../Product/view/Screens/food_detail_screen.dart';
import '../Product/view/Screens/location_screen.dart';
import '../Product/view/Screens/order_complete_screen.dart';
import '../Product/view/Screens/product_show.dart';
import '../Splash/view/splash_screen.dart';

class Routes {
  static const String splashScreen = "/splashScreen";
  static const String loginscreen = "/LoginScreen";
  static const String registerscreen = "/RegisterScreen";
  static const String productshowscreen = "/ProductShowScreen";
  static const String cartscreen = "/CartScreen";
  static const String creditcardscreen = "/CreditCard";
  static const String fooddetailscreen = "/FoodDetailScreen";
  static const String locationscreen = "/LocationScreen";
  static const String ordercompletescreen = "/OrderCompleteScreen";
  static const String resertpasswordscreen = "/ResertPasswordScreen";
  static List<GetPage> getPages = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: loginscreen,
      page: () => const LoginScreen(),
    ),
    GetPage(name: registerscreen, page: () => const RegisterScreen()),
    GetPage(name: productshowscreen, page: () => ProductShowScreen()),
    GetPage(name: cartscreen, page: () => const CartScreen()),
    GetPage(name: creditcardscreen, page: () => const CreditCard()),
    GetPage(name: fooddetailscreen, page: () => const FoodDetailScreen()),
    GetPage(name: locationscreen, page: () => const LocationScreen()),
    GetPage(name: ordercompletescreen, page: () => const OrderCompleteScreen()),
    GetPage(
      name: resertpasswordscreen,
      page: () => ResertPasswordScreen(),
    ),
  ];
}
