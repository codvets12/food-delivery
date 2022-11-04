
import 'package:flutter/material.dart';
import 'package:food_delivery/common/buttons.dart';
import '../../../Routes/routes.dart';


class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEFEFEF),
        body: Stack(
          children: [
            Align(
              alignment:const Alignment(0, -1.5),
              child: Container(
                height: 600,
                width: 600,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
              ),
            ),
            Align(
              alignment:const Alignment(0.1, -0.35),
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
              ),
            ),
            Align(
              alignment:const Alignment(0.01, -0.28),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
              ),
            ),
            Align(
              alignment:const Alignment(0.01, -0.2),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.2),
              child: Image(image: AssetImage("assets/box.png")),
            ),
            const Align(
                alignment: Alignment(0, 0.3),
                child: Text(
                  "Congratulations!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )),
            const Align(
              alignment: Alignment(0, 0.45),
              child: Text(
                "Lorem ipsum dolor sit amet, consect\n etur adipiscing elit.Quis fringilla",
                style: TextStyle(
                    height: 1.5,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Align(
              alignment:const Alignment(0, 0.8),
              child: SocialButtons(
                onTap: () {
                  Navigator.pushNamed(context, Routes.locationscreen);
                
                },
                bgcolor: Colors.black,
                label: "Track Your Order",
              ),
            ),
            Align(
                alignment:const Alignment(0, 0.9),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.creditcardscreen);
                    
                    },
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        ));
  }
}
