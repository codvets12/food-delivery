import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Auth/view/login.dart';

import 'package:food_delivery/common/buttons.dart';
import 'package:food_delivery/Auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController controller = Get.put(AuthController());
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  final reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    log("registration screen");

    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage("assets/authn.png")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: const [
                Text(
                  "Create An Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namecontroller,
                    decoration: const InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (val) {
                      if (val == null) {
                        "Enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                        hintText: "Email or Phone",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (val) {
                      if (!reg.hasMatch(val!)) {
                        return "Email is incorrect";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password is incorrect";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  SocialButtons(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          AuthController.instance.Register(context,
                              name: namecontroller.text,
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                        }
                      },
                      bgcolor: Colors.black,
                      label: "Sign Up"),
                  SizedBox(
                    height: 30,
                  ),
                  Text("or connet with"),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButtons(
                        ischecked: true,
                        onTap: () {},
                        url: "assets/facebook.png",
                        bgcolor: Colors.black12,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SocialButtons(
                        ischecked: true,
                        onTap: () {},
                        url: "assets/chrome.png",
                        bgcolor: Colors.black12,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SocialButtons(
                        ischecked: true,
                        onTap: () {},
                        url: "assets/insta.png",
                        bgcolor: Colors.black12,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(LoginScreen());
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
