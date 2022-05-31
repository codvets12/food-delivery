import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  final String name;
  final String email;
  UserModel({required this.name, required this.email, this.uid});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(name: json['name'], email: json['email'], uid: json['uid']);
  Map<String, dynamic> tojson() => {'name': name, 'email': email, 'uid': uid};
}
