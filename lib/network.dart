import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/model/product.dart';
import 'package:food_delivery/screens/productscreen/Screens/product_show.dart';
import 'package:food_delivery/screens/sellerscreen/seller_home.dart';
import 'Routes/routes.dart';
import 'model/user_model.dart';

class AuthenticationProvider with ChangeNotifier {
  Map data = {};
  //late UserModel currentUser;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<Product> myitems = [];

  List<Product> products = List.empty(growable: true);

  Future<UserModel> Register(
    BuildContext context, {
    required UserModel model,
    required String password,
  }) async {
    try {
      final UserCredential creds = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: model.email,
        password: password,
      )
          .then((value) async {
        model.uid = value.user!.uid;
        model.uid = model.usertype;

        await firestore
            .collection("users")
            .doc(value.user!.uid)
            .set(model.toJson());
        if (model.usertype == 'seller') {
          Navigator.pushNamed(context, Routes.sellerhomescreen);
        } else {
          Navigator.pushNamed(context, Routes.productshowscreen);
        }
        return value;
      });

      return model;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  Future<void> Login(BuildContext context,
      {required String password, required String email}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final documentsnapshot =
            await firestore.collection("users").doc(value.user!.uid).get();
        data = documentsnapshot.data()!;
        if (data['usertype'] == "seller") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductEntry()));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProductShowScreen()));
        }
      });
    } on FirebaseAuthException catch (e) {
      print("error here");
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  void Signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginscreen, (route) => false);
  }

  Future<void> uploadproduct(BuildContext context,
      {required String sellerid,
      required File image,
      required String description,
      required String title,
      required double price,
      required String category}) async {
    final id = DateTime.now().microsecondsSinceEpoch.toString();

    try {
      Product product = Product(
          image: "",
          title: title,
          description: description,
          price: price,
          category: category,
          sellerId: sellerid,
          id: "");

      final imageurl = await uploadimage(
        image: image,
      );
      product.image = imageurl;
      product.id = id;
      await firestore.collection('prouduct').doc(id).set(product.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<String> uploadimage({required File image, String? refernce}) async {
    final storageReference = storage
        .ref(refernce)
        .child('path_${DateTime.now().microsecondsSinceEpoch}');
    TaskSnapshot uploadTask = await storageReference.putFile(image);
    String url = await uploadTask.ref.getDownloadURL();
    log(url);
    return url;
  }

  Future<List<Product>> getproduct() async {
    final querysnapshot = await firestore.collection('prouduct').get();
    products.clear();
    querysnapshot.docs.forEach((element) {
      final data = element.data();
      final product = Product.fromJson(data);
      products.add(product);
    });

    notifyListeners();
    return products;
  }

  void search(String cat) {
    myitems.clear();
    for (int i = 0; i < products.length; i++) {
      String data = products[i].category;
      if (data == cat) {
        myitems.add(products[i]);
      }
    }
    notifyListeners();
  }
}
