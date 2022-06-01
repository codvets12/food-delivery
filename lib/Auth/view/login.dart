import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Auth/controller/auth_controller.dart';

import 'package:food_delivery/common/buttons.dart';

import 'package:food_delivery/Auth/view/register.dart';
import 'package:get/get.dart';

import '../../Product/view/Screens/product_show.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey();
    final reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
                  "Sign in",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        hintText: "Email or Phone",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
                    validator: (val) {
                      if (!reg.hasMatch(val!)) {
                        return "Email is incorrect";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 17, color: Colors.grey)),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Enter your password";
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
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  SocialButtons(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          AuthController.instance.Login(context,
                              email: emailcontroller.text,
                              password: passwordcontroller.text);
                        }
                      },
                      bgcolor: Colors.black,
                      label: "Sign in"),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "or connet with",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  const SizedBox(
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
                      const SizedBox(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 70.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            Get.off(RegisterScreen());
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
