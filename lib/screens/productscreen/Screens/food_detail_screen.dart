
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../Routes/routes.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> names = ["all", "soups", "Dishes", "Salad", "Salad"];
    List<String> images = [
      "assets/all.png",
      "assets/Dishes.png",
      "assets/salad 1.png",
      "assets/soup 1.png"
    ];
    final List<String> imagesList = [
      'assets/firstpic.png',
      'assets/garlic.png',
      'assets/pizza.png',
    ];

    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.productshowscreen);
                            
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
                    const    Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(40),
                              image: const DecorationImage(
                                  image: AssetImage("assets/image.png"),
                                  fit: BoxFit.contain)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 350,
                          // enlargeCenterPage: true,
                          //scrollDirection: Axis.vertical,
                          onPageChanged: (index, reason) {
                            setState(
                              () {
                                _currentIndex = index;
                              },
                            );
                          },
                        ),
                        items: imagesList
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius:const BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        item,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imagesList.map((urlOfItem) {
                          int index = imagesList.indexOf(urlOfItem);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin:const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Color.fromRGBO(0, 0, 0, 0.8)
                                  : Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  SizedBox(
                      height: 180,
                      width: 360,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 20),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            images[index],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(names[index]),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35.0, vertical: 15),
                              child: Row(
                                children: const [
                                  Text(
                                    "Garlic Butter Beef",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:const [
                                  Text(
                                    "it is taste food ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    "(150 reviews)",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35.0, vertical: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "\$18.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 45,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          "CHECK OUT",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.cartscreen);
                                  
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
