import 'dart:convert';

class AppUser {
  String? id;
  String? userName;
  String? email;
  String? phone;
  AppUser(
      {required this.id,
      required this.email,
      required this.userName,
      required this.phone});

  AppUser.fromJson(Map json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phone = json[phone];
  }

  toMap() {
    return {
      'userName': this.userName,
      'email': this.email,
      'phone': this.phone
    };
  }
}
