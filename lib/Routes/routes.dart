import 'package:flutter/cupertino.dart';
import 'package:food_delivery/screens/sellerscreen/seller_home.dart';


import '../screens/authenticationscreen/login.dart';
import '../screens/authenticationscreen/register.dart';
import '../screens/authenticationscreen/resert_password.dart';
import '../screens/productscreen/Screens/cart.dart';
import '../screens/productscreen/Screens/credit_card.dart';

import '../screens/productscreen/Screens/food_detail_screen.dart';
import '../screens/productscreen/Screens/location_screen.dart';
import '../screens/productscreen/Screens/order_complete_screen.dart';
import '../screens/productscreen/Screens/product_show.dart';
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
  static const String sellerhomescreen = "/SellerHome";




  static Map<String,Widget Function(BuildContext)>myRoutes(BuildContext context)=>{
    splashScreen:(context)=> const SplashScreen(),
    loginscreen:(context)=> const LoginScreen(),
    registerscreen:(context)=> const RegisterScreen(),
    productshowscreen:(context)=>const ProductShowScreen(),
    cartscreen:(context)=>const CartScreen(),
    creditcardscreen:(context)=>const CreditCard(),
    fooddetailscreen:(context)=>const FoodDetailScreen(),
    locationscreen:(context)=>const LocationScreen(),
    ordercompletescreen:(context)=>const OrderCompleteScreen(),
    resertpasswordscreen:(context)=>const ResertPasswordScreen(),
    sellerhomescreen:(context)=> ProductEntry()
    
  };
}
