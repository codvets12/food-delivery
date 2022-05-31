import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons(
      {Key? key,
      //required this.size,
      required this.onTap,
      required this.bgcolor,
      this.borderRadius,
      this.textcolor,
      this.url,
      this.color,
      this.iconColor,
      this.label,
      this.ischecked})
      : super(key: key);
  final String? label;
  String? url;
  final Color bgcolor;
  bool? ischecked;
  Color? color;
  Color? textcolor;
  Color? iconColor;
  Function()? onTap;
  // double size;
  BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (ischecked != null)
            ? GestureDetector(
                child: Container(
                  // backgroundColor: const Color(0xFF888888),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Image(image: AssetImage(url!))),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(
                //           color: Colors.grey,
                //           borderRadius: BorderRadius.all(Radius.circular(0))),
                //       height: 50,
                //       width: 60,
                //       child: Icon(
                //         icon,
                //         color: iconColor,
                //       ),
                //     )
                //   ],
                // ),
                onTap: onTap,
              )
            : Container(
                decoration: BoxDecoration(
                    color: bgcolor, borderRadius: BorderRadius.circular(15)),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.77,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: bgcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: onTap,
                    child: Center(
                      child: Text(
                        label!,
                        style: TextStyle(color: textcolor, fontSize: 16),
                      ),
                    ))));
  }
}
