import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class SellerProvider with ChangeNotifier {
  File? _image;
  String? reference;
  final FirebaseStorage storage = FirebaseStorage.instance;
  uploadimages(BuildContext context) async {
    print("uploading images funtion");
    final stroagerefrence =
        storage.ref().child('image/imagename').putFile(_image!);
// TaskSnapshot uploadTask=await stroagerefrence.putFile(_image!);
//  final String url=await stroagerefrence.ref.getDownloadURL();
//  return url;
  }
}
