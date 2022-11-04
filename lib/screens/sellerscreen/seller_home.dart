import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/network.dart';
import 'package:food_delivery/provider/seller_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class ProductEntry extends StatefulWidget {
  ProductEntry({Key? key}) : super(key: key);

  @override
  State<ProductEntry> createState() => _ProductEntryState();
}

class _ProductEntryState extends State<ProductEntry> {
  final _formKey = GlobalKey<FormState>();

  File? file;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  String? _category;
  int? _discount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final ImageSource? source = await getimage(context);
                  print("This is source+$source");
                  if (source != null) {
                    final rawFile =
                        await ImagePicker().pickImage(source: source);
                    if (rawFile != null) {
                      setState(() {
                        file = File(rawFile.path);
                      });
                      print("This is image path $file");
                    }
                    // final file = File();
                  }
                },
                child: CircleAvatar(
                  backgroundImage: file != null ? FileImage(file!) : null,
                  radius: 100,
                  child: file != null
                      ? SizedBox()
                      : const Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 35,
                          ),
                        ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _titleController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                'Product Title',
                              ),
                              hintText: "Nike Air",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _descriptionController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty field";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                'Description',
                              ),
                              hintText: "Nike Air is good",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _priceController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Empty field";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text(
                                'Price',
                              ),
                              hintText: "25.00",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField<String>(
                            validator: (val) {
                              if (val == null) {
                                return "Select a category";
                              }

                              return null;
                            },
                            hint: Text("Select category"),
                            onChanged: (val) {
                              _category = val!;
                            },
                            items: categories.map((cat) {
                              return DropdownMenuItem<String>(
                                value: cat,
                                child: Text(cat),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      if (file == null || _category == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Image or caterogy is null")));
                      } else {
                        Provider.of<AuthenticationProvider>(context,
                                listen: false)
                            .uploadproduct(context,
                                sellerid: FirebaseAuth.instance.currentUser!.uid
                                    .toString(),
                                image: file!,
                                description: _descriptionController.text,
                                title: _titleController.text,
                                price: double.parse(_priceController.text),
                                category: _category!);
                       
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                  }
                },
                child: Text('Upload Product'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AuthenticationProvider>(context, listen: false)
                      .Signout(context);
                      
                },
                child: const Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> categories = ["Soup", "Salad", "Beef pizza", "Vegetable rice"];
}


Future<ImageSource?> getimage(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          width: double.infinity,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        print("camera");
                        Navigator.pop(context, ImageSource.camera);
                      },
                      child: const Text("Camera"))),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        print("gallery");
                        Navigator.pop(context, ImageSource.gallery);
                      },
                      child: const Text("Gallery"))),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("cancel")))
            ],
          ),
        );
      });
}
