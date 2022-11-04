
import 'package:flutter/material.dart';
import 'package:food_delivery/common/buttons.dart';
import '../../Routes/routes.dart';


class ResertPasswordScreen extends StatefulWidget {
  const ResertPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResertPasswordScreen> createState() => _ResertPasswordScreenState();
}

class _ResertPasswordScreenState extends State<ResertPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey();

    final reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context,Routes.loginscreen);
                
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Resert Password",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter an email address you use to sign in to",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                              hintText: "Email ",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 17)),
                          validator: (val) {
                            if (!reg.hasMatch(val!)) {
                              return "Email is incorrect";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SocialButtons(
                            onTap: () {
                              // try {
                              //   if (_formkey.currentState!.validate()) {
                              //     print(_formkey);
                              //     Provider.of<AuthenticationProvider>(context).ResertPassword(
                              //         emailcontroller.text.trim());
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) {
                              //           return AlertDialog(
                              //             shape: RoundedRectangleBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(20)),
                              //             backgroundColor: Colors.black38,
                              //             title: const Center(
                              //               child: Text(
                              //                 'Welcome',
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontWeight: FontWeight.bold),
                              //               ),
                              //             ),
                              //             content: const Text(
                              //                 'New Password send on your email',
                              //                 style: TextStyle(
                              //                     color: Colors.white,
                              //                     fontWeight: FontWeight.bold)),
                              //             actions: [
                              //               ElevatedButton(
                              //                 onPressed: () {
                              //                   Get.offAll(
                              //                       ResertPasswordScreen());
                              //                 }, // function used to perform after pressing the button
                              //                 child: Text('OK'),
                              //               ),
                              //             ],
                              //           );
                              //         });

                              //     // Get.offAll(LoginScreen());
                              //   }
                              // } on FirebaseAuthException catch (e) {
                              //   print(e);
                              // }
                            },
                            bgcolor: Colors.black,
                            label: "Resert Password"),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
