import 'dart:developer';

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 2,
            height: 80,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 80),
                  painter: BNBCustomPainter(),
                ),
                Center(
                  heightFactor: 0.6,
                  child: StreamBuilder(builder: (context, snapshot) {
                    int cartLength = 0;
                    if (snapshot.data != null) {
                      WidgetsBinding.instance
                          .addPostFrameCallback((timeStamp) {});
                    }

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        FloatingActionButton(
                          backgroundColor:
                              const Color.fromRGBO(255, 121, 63, 1),
                          child: const Icon(Icons.shopping_basket),
                          elevation: 0.1,
                          onPressed: () {},
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 2,
                  //ScreenUtils.screenWidth(context),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: currentIndex == 0
                              ? const Color.fromRGBO(255, 121, 63, 1)
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                        splashColor: Colors.white,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: currentIndex == 1
                                ? const Color.fromRGBO(255, 121, 63, 1)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {}),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.chat,
                            color: currentIndex == 2
                                ? const Color.fromRGBO(255, 121, 63, 1)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: currentIndex == 3
                                ? const Color.fromRGBO(255, 121, 63, 1)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
