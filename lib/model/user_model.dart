///[ShoppieUser] is a data model that we get and create on [Firestore] database
class UserModel {
  final String email;
  final String name;
  String usertype;
  String? uid;

  UserModel({
    required this.email,
    required this.name,
    required this.usertype,
    this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json,
          {required String uid}) =>
      UserModel(
          uid: json["uid"] ?? uid,
          email: json['email'],
          name: json['name'],
          usertype: json['usertype']);

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "usertype": usertype,
      };
}
