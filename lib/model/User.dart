import 'dart:convert';
import 'dart:ffi';

class AppUser {
  String? id;
  String? userName;
  String? email;
  String? phone;
  String? address;
  List<dynamic>? favorites = [];
  AppUser({
    required this.id,
    required this.email,
    required this.userName,
    required this.phone,
  });

  AppUser.fromJson(Map json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phone = json[phone];
    favorites = json['favorites'];
    address = json['address'];
  }

  toMap() {
    return {
      'userName': this.userName,
      'email': this.email,
      'phone': this.phone,
      'favorites': this.favorites,
      'address': this.address
    };
  }
}
