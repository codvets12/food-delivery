
import 'package:flutter/material.dart';
import 'package:food_delivery/common/buttons.dart';
import '../../../Routes/routes.dart';
import '../../../common/cart_widget.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.fooddetailscreen);
                  
                      },
                      child: Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child:const Center(
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                 const   Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Container()
                  ],
                ),
              ),
              cart_widget(
                  color: const Color(0xffFFEBE2),
                  rating: "4.9",
                  Reviews: "Reviews",
                  icon: Icons.star,
                  url: "assets/firstpic.png",
                  vegetablename: "Vegetable Rice",
                  price: "\$1500",
                  addicon: Icons.add_circle,
                  removeicon: Icons.remove_circle,
                  number: "2"),
            const  SizedBox(
                height: 10,
              ),
              cart_widget(
                  color: const Color(0xffFFEBE2),
                  url: "assets/Pizza.png",
                  vegetablename: "Vegetable Rice",
                  price: "\$1500",
                  addicon: Icons.add_circle,
                  removeicon: Icons.remove_circle,
                  number: "2"),
           const   SizedBox(
                height: 10,
              ),
              cart_widget(
                  color: const Color(0xffC7D6A2),
                  url: "assets/vegetable.png",
                  vegetablename: "Vegetable Rice",
                  price: "\$1500",
                  addicon: Icons.add_circle,
                  removeicon: Icons.remove_circle,
                  number: "2"),
           const   SizedBox(
                height: 10,
              ),
              cart_widget(
                  color: const Color(0xff68906A),
                  url: "assets/salad.png",
                  vegetablename: "Vegetable Rice",
                  price: "\$1500",
                  addicon: Icons.add_circle,
                  removeicon: Icons.remove_circle,
                  number: "2"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "\$68.00",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SocialButtons(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.creditcardscreen);
                  
                  },
                  bgcolor: Colors.black,
                  label: "Check Out"),
            ],
          ),
        ),
      ),
    );
  }
}
