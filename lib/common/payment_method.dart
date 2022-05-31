// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../splash/controller/splash_controller.dart';

// class PaymentMethod extends StatelessWidget {
//   PaymentMethod(
//       {Key? key,
//       required this.code,
//       required this.imageurl,
//       required this.methodname})
//       : super(key: key);
//   String imageurl;
//   String methodname;
//   String code;

//   @override
//   Widget build(BuildContext context) {
//     final SplashController controller = Get.put(SplashController());
//     bool ischecked = false;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 38.0),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.16,
//           width: MediaQuery.of(context).size.width * 0.9,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [Image(image: AssetImage(imageurl))],
//                 ),
//               ),
//               const SizedBox(
//                 width: 30,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     methodname,
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
//                   ),
//                  const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     code,
//                     style:const TextStyle(color: const Color(0xff888888)),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Checkbox(
//                         shape: const CircleBorder(),
//                         value: ischecked,
//                         onChanged: (value) {
//                         //  Get.find<SplashController>().checkbox();
//                         })
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod(
      {Key? key, required this.code, required this.name, required this.url})
      : super(key: key);
  String url;
  String code;
  String name;
  @override
  Widget build(BuildContext context) {
    bool ischecked = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image(image: AssetImage(url))],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  code,
                  style: const TextStyle(color: const Color(0xff888888)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      shape: const CircleBorder(),
                      value: ischecked,
                      onChanged: (value) {})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
