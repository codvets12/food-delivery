import 'package:flutter/material.dart';
import 'package:food_delivery/common/buttons.dart';
import 'package:provider/provider.dart';
import '../../Routes/routes.dart';
import '../../network.dart';

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
              children:const [
                 Image(image: AssetImage("assets/authn.png")),
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
   const       SizedBox(
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
                    decoration: const InputDecoration(
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
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: const InputDecoration(
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
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.resertpasswordscreen);
                          },
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
                        Provider.of<AuthenticationProvider>(context,
                                listen: false)
                            .Login(context,
                                email: emailcontroller.text.trim(),
                                password: passwordcontroller.text.trim());
                        // if (_formkey.currentState!.validate()) {
                        //   Provider.of<AuthenticationProvider>(context,
                        //           listen: false)
                        //       .Login(context,
                        //           email: emailcontroller.text.trim(),
                        //           password: passwordcontroller.text.trim());
                        // }
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
                            Navigator.pushNamed(context, Routes.registerscreen);
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
