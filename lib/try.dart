// import 'dart:developer';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageuploadingScreen extends StatefulWidget {
//   const ImageuploadingScreen({Key? key}) : super(key: key);

//   @override
//   State<ImageuploadingScreen> createState() => _ImageuploadingScreenState();
// }

// class _ImageuploadingScreenState extends State<ImageuploadingScreen> {
//   FirebaseStorage storage = FirebaseStorage.instance;

//   String imageUrl = '';
//   List<XFile> _selectedimages = [];
//   List<XFile>? images;
//   List<XFile> imgs = [];
//   File? _imageFile;
//   String uniqueimage = DateTime.now().microsecondsSinceEpoch.toString();
//   final ImagePicker _picker = ImagePicker();
//   openImages() async {
//     try {
//       var pickedfiles = await _picker.pickMultiImage();
//       //you can use ImageCourse.camera for Camera capture
//       if (pickedfiles != null) {
//         log(pickedfiles.runtimeType.toString());
//         images = pickedfiles;
//         log(images!.length.toString());
//         log(images![0].path);
//         log(images![0].name);
//         setState(() {});
//       } else {
//         print("No image is selected.");
//       }
//     } catch (e) {
//       print("error while picking file.");
//     }
//   }

//   Future uploadImageToFirebase(BuildContext context) async {
//     Reference referenceroot = storage.ref().child("images").child(uniqueimage);
//     print("This is refernce of root $referenceroot");
// //     Reference referenceimage = referenceroot.child("images");
// // print("This is refrence of imagge $referenceimage");
// //     Reference referenceimageupload = referenceimage.child(uniqueimage);
// // print("Refrence of imageupload$referenceimageupload");
//     try {
//       await referenceroot.putFile(File(_imageFile!.path));
//       imageUrl = await referenceroot.getDownloadURL();

//       print(imageUrl);
//       FirebaseFirestore.instance.collection("images").doc(uniqueimage).set({
//         "id": FirebaseAuth.instance.currentUser,
//         'email': FirebaseAuth.instance.currentUser,
//         'image': imageUrl,
//         "CreatedAt": DateTime.now()
//       });
//       print("upload imges to firestore");
//     } catch (error, message) {
//       print(error.toString());
//       print(message.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           //open button ----------------
//           ElevatedButton(
//               onPressed: () {
//                 openImages();
//               },
//               child: Text("Open Images")),

//           Divider(),
//           Text("Picked Files:"),
//           Divider(),

//           images != null
//               ? Wrap(
//                   children: images!.map((imageone) {
//                     return Container(
//                         child: Card(
//                       child: Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.file(File(imageone.path)),
//                       ),
//                     ));
//                   }).toList(),
//                 )
//               : Container()
//         ],
//       ),
//     )

//         //  SafeArea(
//         //   child:
//         //   Column(
//         //     children: [
//         //       Center(
//         //         child: InkWell(
//         //           onTap: () async {
//         //             openImages();
//         //             // final ImageSource? source = await getimages(context);
//         //             // if (source != null) {
//         //             //   final rawfile =
//         //             //       await ImagePicker().pickImage(source: source);
//         //             //   if (rawfile != null) {
//         //             //     setState(() {
//         //             //       _imageFile = File(rawfile.path);
//         //             //       print("Its a rawfile path");
//         //             //       print(_imageFile);
//         //             //     });
//         //             //   }
//         //             // }
//         //           },
//         //           child: CircleAvatar(
//         //             radius: 30,
//         //             backgroundImage:
//         //                 _imageFile != null ? FileImage(_imageFile!) : null,
//         //             child: _imageFile != null
//         //                 ? const SizedBox()
//         //                 : const Center(
//         //                     child: Icon(Icons.camera),
//         //                   ),
//         //           ),
//         //         ),
//         //       ),
//         //       ElevatedButton(
//         //           onPressed: () {
//         //             uploadImageToFirebase(context);
//         //           },
//         //           child: const Text("Upload image"))
//         //     ],
//         //   ),
//         // ),
//         );
//   }

//   Future<ImageSource?> getimages(BuildContext context) async {
//     return showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             height: 150,
//             width: double.infinity,
//             color: Colors.grey,
//             child: Row(
//               children: [
//                 Expanded(
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context, ImageSource.camera);
//                         },
//                         child: const Text("Camera"))),
//                 Expanded(
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context, ImageSource.gallery);
//                         },
//                         child: const Text("Gallery"))),
//                 Expanded(
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Cancel")))
//               ],
//             ),
//           );
//         });
//   }

//   // copy funtion //

// }
