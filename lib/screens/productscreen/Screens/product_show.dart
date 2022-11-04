import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/model/product.dart';
import 'package:provider/provider.dart';
import '../../../Routes/routes.dart';
import '../../../network.dart';

class ProductShowScreen extends StatefulWidget {
  const ProductShowScreen({Key? key}) : super(key: key);

  @override
  State<ProductShowScreen> createState() => _ProductShowScreenState();
}

class _ProductShowScreenState extends State<ProductShowScreen> {
  List<String> names = ["all", "soups", "Dishes", "Salad", "Salad"];
  List<String> images = [
    "assets/all.png",
    "assets/Dishes.png",
    "assets/salad 1.png",
    "assets/soup 1.png"
  ];

  List<Product> items = [];
  @override
  void initState() {
    products(context);
    super.initState();
  }

  products(BuildContext context) async {
    items = await Provider.of<AuthenticationProvider>(context, listen: false)
        .getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_add),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.card_travel),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.card_travel),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.card_travel),
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Menu",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<AuthenticationProvider>(context, listen: false)
                        .Signout(context);
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
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
            height: 150,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Consumer<AuthenticationProvider>(
                  builder: (context, provider, _) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    String category = provider.products[index].category;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<AuthenticationProvider>(context,
                                  listen: false)
                              .search(category);
                          log(category);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        provider.products[index].image,
                                      ),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              //child:
                              // Center(
                              //     child:Image(image: NetworkImage(provider.products[index].image),fit: BoxFit.cover,)
                              // //      Image.network(
                              // //   provider.products[index].image.toString(),
                              // //   fit: BoxFit.cover,
                              // // )
                              // ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(provider.products[index].category),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
          Expanded(
            child: Consumer<AuthenticationProvider>(
                builder: (context, provider, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: MasonryGridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: provider.myitems.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            // crossAxisSpacing: 8.0,
                            // mainAxisSpacing: 8.0,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Text(
                          "our popular food",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.fooddetailscreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    provider.myitems[index].image,
                                    height: 180,
                                  ),
                                  Text(
                                    provider.myitems[index].category,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(provider.myitems[index].description
                                      .toString()),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          provider.myitems[index].price
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.favorite))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    }),
              );
            }),
          )
        ],
      )),
    );
  }
}
