
import 'package:flutter/material.dart';
import 'package:food_delivery/model/user_model.dart';


import 'package:food_delivery/common/buttons.dart';

import 'package:provider/provider.dart';

import '../../Routes/routes.dart';
import '../../network.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  String _selectedType = 'seller';

  // Group Value for Radio Button.
  int id = 1;
  final reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: "seller",
                                    groupValue: _selectedType,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedType = value!;
                                        print(_selectedType);
                                      });
                                    }),
                                const Expanded(
                                  child: Text(
                                    'Seller',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio(
                                    value: "buyer",
                                    groupValue: _selectedType,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedType = value!;
                                        print(_selectedType);
                                      });
                                    }),
                                const Expanded(
                                    child: Text(
                                  'Buyer',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))
                              ],
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SocialButtons(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          Provider.of<AuthenticationProvider>(context,
                                  listen: false)
                              .Register(context,
                                  model: UserModel(
                                      email: emailcontroller.text.trim(),
                                      name: namecontroller.text.trim(),
                                      usertype: _selectedType),
                                  password: passwordcontroller.text.trim());
                          print(namecontroller.text);
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                          print(_selectedType);

                          // name: namecontroller.text.trim(),
                          // email: emailcontroller.text.trim(),

                        }
                      },
                      bgcolor: Colors.black,
                      label: "Sign Up"),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("or connet with"),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
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
                    Navigator.pushNamed(context, Routes.loginscreen);
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
