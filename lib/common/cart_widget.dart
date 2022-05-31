import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cart_widget extends StatelessWidget {
  cart_widget(
      {Key? key,
      required this.url,
      required this.vegetablename,
      required this.price,
      required this.addicon,
      required this.removeicon,
      required this.number,
      this.icon,
      this.Reviews,
      this.rating,
      required this.color})
      : super(
          key: key,
        );
  Color color;
  String url;
  String vegetablename;
  IconData? icon;
  String? rating;
  String? Reviews;
  String price;
  IconData addicon;
  IconData removeicon;
  String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .18,
          //130,
          width: MediaQuery.of(context).size.width * .9,
          //370,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 19),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: color,
                          //const Color(0xffFFEBE2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Image(image: AssetImage(url)),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vegetablename,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(rating ?? ""),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          Reviews ?? "",
                          style: TextStyle(
                              color: const Color(0xff888888),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      price,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(removeicon),
                        SizedBox(
                          width: 3,
                        ),
                        Text(number),
                        Icon(addicon),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
