import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/common/buttons.dart';
import 'package:food_delivery/view/Screens/first.dart';
import 'package:food_delivery/view/Screens/register.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
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
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Email or Phone",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.grey))),
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
                      Get.off(FirstScreen());
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
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
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
