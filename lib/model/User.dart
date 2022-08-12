import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/animation.dart';

class AppUser {
  String? id;
  String? userName;
  String? email;
  String? phone;
  String? address;
  String? imagePath;
  List<dynamic>? favorites = [];
  List<dynamic>? basket = [];
  AppUser(
      {required this.id,
      required this.email,
      required this.userName,
      required this.phone,
      required this.imagePath});

  AppUser.fromJson(Map json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    favorites = json['favorites'];
    basket = json['basket'];
    address = json['address'];
    imagePath = json['imagePath'];
  }

  toMap() {
    return {
      'userName': this.userName,
      'email': this.email,
      'phone': this.phone,
      'favorites': this.favorites,
      'address': this.address,
      'basket': this.basket,
      'imagePath': this.imagePath
    };
  }
}
