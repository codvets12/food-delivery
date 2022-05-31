import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  FoodContainer(
      {Key? key,
      required this.description,
      required this.foodname,
      required this.icon,
      required this.rate,
      required this.url,
      required this.onTap})
      : super(key: key);
  String url;
  String foodname;
  String description;
  String rate;
  IconData icon;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                // color: Colors.grey,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage(url), fit: BoxFit.cover)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      foodname,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Text(
                description,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rate,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
