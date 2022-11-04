// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter/cupertino.dart';

// import 'package:get/get.dart';

// import '../Routes/routes.dart';
// import '../model/user_model.dart';
// import '../../network.dart';

// class AuthenticationProvider with ChangeNotifier {
//   final firebaseAuth = Network();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   int _selectedIndex = 0;
//   int selectedindex = 0;
//   //int _currentIndex = 0;
//   void OnPageChanged(index, reason) {
//     _selectedIndex = index;
//   }

//   void OnTappedItem(int index) {
//     selectedindex = index;
//   }

//   void Register(BuildContext context,
//       {required String name,
//       required String email,
//       required String password}) async {
//     try {
//       await firebaseAuth.Register(
//         model: UserModel(name: name, email: email),
//         password: password,
//       );
//       Navigator.pushReplacementNamed(context, Routes.productshowscreen);
//     } on FirebaseAuthException catch (error) {
//       //log("controller class and register funtion");
//       log(error.toString());
//       throw Get.snackbar("About authenticaion", "message for user",
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: Text("Account creataion failed"),
//           messageText: Text(error.toString()));
//     }
//   }

//   void Login(BuildContext context,
//       {required String email, required String password}) {
//     try {
//       firebaseAuth.Login(password: password, email: email);
//       Navigator.pushReplacementNamed(context, Routes.productshowscreen);
//     } on FirebaseAuthException catch (error) {
//       print("error on login in provider class");
//       throw FirebaseAuthException(code: error.code, message: error.message);
//     }
//   }

//   void Signout(BuildContext context) {
//     Navigator.pop(context);
//     Navigator.pushNamedAndRemoveUntil(
//         context, Routes.loginscreen, (route) => false);
//   }

//   Future<void> ResertPassword(String email) async {
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//     } on FirebaseAuthException catch (e) {
//       log("problem is in main funtion");
//     }
//   }
// }
