
import 'package:flutter/material.dart';
import 'package:food_delivery/common/buttons.dart';
import 'package:food_delivery/common/payment_method.dart';
import '../../../Routes/routes.dart';


class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEFEFEF),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.cartscreen);
                        
                        },
                        child: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      const Text(
                        "Add Your Card",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "64 Jalalabath,Amborkhana,Sylhet",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff888888),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: const[Icon(Icons.edit)],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Payment Method",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black),
                            child: Stack(
                              children: [
                                const Positioned(
                                  bottom: -1,
                                  left: 60,
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundColor: Color(0xff3D3D3D),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Credit Card",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      Text(
                                        "1452 5678490 54856",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mohammad Ali",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                const Positioned(
                                  right: 40,
                                  bottom: 20,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.yellow,
                                  ),
                                ),
                                const Positioned(
                                  right: 53,
                                  bottom: 20,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 38.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.16,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(image: AssetImage("assets/paypal 1.png"))
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "PayPal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "**** **5824 58741",
                              style: TextStyle(color: const Color(0xff888888)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  shape: const CircleBorder(),
                                  value: ischecked,
                                  onChanged: (value) {
                                    setState(() {
                                      ischecked = value!;
                                    });
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PaymentMethod(
                    code: "**** **5824 58741",
                    name: "visa Pay",
                    url: "assets/paypal 1.png"),
          const      SizedBox(
                  height: 20,
                ),
                PaymentMethod(
                    code: "**** **5824 58741",
                    name: "visa Pay",
                    url: "assets/paypal 1.png"),
           const     SizedBox(
                  height: 20,
                ),
                SocialButtons(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.ordercompletescreen);
                    
                  },
                  bgcolor: Colors.black,
                  label: "PAYMENT",
                )
              ],
            ),
          ),
        ));
  }
}
