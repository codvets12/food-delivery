import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'order_complete_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Get.to(OrderCompleteScreen());
                },
                child: Container(
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("assets/map.png"),
                          fit: BoxFit.fill)),
                )),
            Expanded(
                child: Container(
              // color: Colors.green,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    // color: Colors.orange,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Spacer(),
                              Expanded(
                                  child: Icon(
                                Icons.watch_later_outlined,
                                size: 25,
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Delivery Time',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  )),
                              Expanded(
                                  child: Icon(
                                Icons.location_on_outlined,
                                size: 25,
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Delivery Place',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  )),
                              Spacer()
                            ],
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                //   color: Colors.yellow,
                                child: const Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    '30 minutes',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 50),
                                //   color: Colors.lightGreen,
                                child: const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Badda, St 230',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.black87,
                    child: Row(
                      children: [
                        const Expanded(
                            child: CircleAvatar(
                          radius: 30,
                          child: Image(image: AssetImage("assets/man.png")),
                        )),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Spacer(),
                              Expanded(
                                  child: Container(
                                //color: Colors.lightGreen,
                                child: const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Saruwar Hossen',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    //color: Colors.black,
                                    child: const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Delivery man',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(right: 25),
                              //  color: Colors.black,
                              child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.phone)),
                            ))
                      ],
                    ),
                  )),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
