import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/data/firestore_helper.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FireStoreProvider extends ChangeNotifier {
  List<Product> products = [];
  List<dynamic> favorites = [];
  List<Product> favoriteProdcuts = [];
  List<Product> categoires = [];
  List<Product> WearableCategory = [];
  List<Product> PhoneCategory = [];
  List<Product> LaptopCategory = [];
  List<Product> SoundCategory = [];
  List<Tab> Tabs = [
    Tab(
      text: "Wearable",
    ),
    Tab(
      text: "Phones",
    ),
    Tab(
      text: "Sound",
    ),
    Tab(
      text: "Laptops",
    ),
  ];
  List<Widget> categoriesTab = [];

  FireStoreProvider() {
    // readCategories();
    readProductsCategory();
    fillFavorites();
  }
  readProductsCategory() async {
    WearableCategory = await FireStoreHelper.instence
        .readCategoryProducts("NyC9FBzbJ34VeseCJLhj");
    PhoneCategory = await FireStoreHelper.instence
        .readCategoryProducts("gmIjumIgeIeT7sP8r7JT");
    LaptopCategory = await FireStoreHelper.instence
        .readCategoryProducts("lUEeEurLtrzNlwbtfC4u");
    SoundCategory = await FireStoreHelper.instence
        .readCategoryProducts("kDGWaYqtAXRJuHJ7rZRu");

    notifyListeners();
  }

  readCategories() async {
    categoires = await FireStoreHelper.instence.getAllCategory();

    categoriesTab = List.generate(
      categoires.length,
      (index) => Tab(
        text: categoires[index].name,
      ),
    );
    notifyListeners();
  }

  addProductToFavorites(String productId) async {
    await FireStoreHelper.instence.productById(productId);
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .favorites!
        .add(productId);
    await FireStoreHelper.instence.addToFavorites();
    fillFavorites();
  }

  removeFromFavorites(String productId) async {
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .favorites!
        .remove(productId);
    await FireStoreHelper.instence.addToFavorites();
    fillFavorites();
  }

  fillFavorites() async {
    favorites = await FireStoreHelper.instence.readFavorites(
        await Provider.of<DBprovider>(AppRouter.navKey.currentContext!,
                listen: false)
            .getUserId());
    favoriteProdcuts.clear();
    favorites.forEach((element) async {
      favoriteProdcuts.add(await ProductById(element));
    });

    notifyListeners();
  }

  checkFavorite(String productId) {
    return favorites.contains(productId);
  }

  ProductById(String productId) async {
    return await FireStoreHelper.instence.productById(productId);
  }
}
