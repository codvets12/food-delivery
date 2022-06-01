import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/Auth/controller/auth_controller.dart';

import 'package:food_delivery/common/bottom_navigation.dart';
import 'package:food_delivery/common/food_container.dart';
import 'package:get/get.dart';

import 'food_detail_screen.dart';

class ProductShowScreen extends StatelessWidget {
  ProductShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> names = ["all", "soups", "Dishes", "Salad", "Salad"];
    List<String> images = [
      "assets/all.png",
      "assets/Dishes.png",
      "assets/salad 1.png",
      "assets/soup 1.png"
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
                      const Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthController.instance.Signout(context);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(40),
                              image: const DecorationImage(
                                  image: AssetImage("assets/image.png"),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 55,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: const [
                        Icon(Icons.search),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Search")
                      ],
                    ),
                  ),
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
                                  child: Image(
                                    image: AssetImage(
                                      images[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(names[index]),
                            ],
                          ),
                        );
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 14,
                        children: [
                          const StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 0.4,
                              child: Text(
                                "Our Popular\nFood",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.4,
                              child: FoodContainer(
                                onTap: () {
                                  Get.off(FoodDetailScreen());
                                },
                                description: "this is vegetable rice",
                                foodname: 'Vegetable Rice',
                                icon: Icons.favorite,
                                rate: "\$15.00",
                                url: "assets/firstpic.png",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.4,
                              child: FoodContainer(
                                  onTap: () {},
                                  description: "this is food",
                                  foodname: 'Garlic Beef',
                                  icon: Icons.favorite,
                                  rate: "\$15.00",
                                  url: "assets/firstpic.png")),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.4,
                              child: FoodContainer(
                                description: "this is vegetable rice",
                                foodname: 'Vegetable Rice',
                                icon: Icons.favorite,
                                rate: "\$15.00",
                                url: "assets/firstpic.png",
                                onTap: () {},
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1.4,
                              child: FoodContainer(
                                onTap: () {},
                                description: "this is vegetable rice",
                                foodname: 'Vegetable Rice',
                                icon: Icons.favorite,
                                rate: "\$15.00",
                                url: "assets/firstpic.png",
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
