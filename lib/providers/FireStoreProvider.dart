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
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FireStoreProvider extends ChangeNotifier {
  bool loading = true;
  List<dynamic> favorites = [];
  List<Product> favoriteProdcuts = [];
  List<dynamic> basket = [];
  List<Product> basketProducts = [];
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

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();

  File? selectedImage;
  FireStoreProvider() {
    fillData();
  }

  fillData() async {
    await fillFavorites();
    await readProductsCategory();
    await fillBasket();
  }

  readProductsCategory() async {
    WearableCategory = await FireStoreHelper.instence
        .readCategoryProducts("NyC9FBzbJ34VeseCJLhj");
    SoundCategory = await FireStoreHelper.instence
        .readCategoryProducts("kDGWaYqtAXRJuHJ7rZRu");
    PhoneCategory = await FireStoreHelper.instence
        .readCategoryProducts("gmIjumIgeIeT7sP8r7JT");
    LaptopCategory = await FireStoreHelper.instence
        .readCategoryProducts("lUEeEurLtrzNlwbtfC4u");

    notifyListeners();
  }

  // readCategories() async {
  //   categoires = await FireStoreHelper.instence.getAllCategory();

  //   categoriesTab = List.generate(
  //     categoires.length,
  //     (index) => Tab(
  //       text: categoires[index].name,
  //     ),
  //   );
  //   notifyListeners();
  // }

  addProductToFavorites(String productId) async {
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .favorites!
        .add(productId);
    await FireStoreHelper.instence.updateUser();
    fillFavorites();
  }

  removeFromFavorites(String productId) async {
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .favorites!
        .remove(productId);
    await FireStoreHelper.instence.updateUser();
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

  fillBasket() async {
    String userId = await Provider.of<DBprovider>(
            AppRouter.navKey.currentContext!,
            listen: false)
        .getUserId();

    basket = await FireStoreHelper.instence.readBasket(userId);

    basketProducts.clear();
    basket.forEach((element) async {
      basketProducts.add(await ProductById(element));
    });

    notifyListeners();
  }

  removeFromBasket(String productId) async {
    await Provider.of<DBprovider>(AppRouter.navKey.currentContext!,
            listen: false)
        .user!
        .basket!
        .remove(productId);
    await FireStoreHelper.instence.updateUser();
    basketProducts.removeWhere((element) {
      return element.id == productId;
    });
    notifyListeners();
  }

  checkFavorite(String productId) {
    return favorites.contains(productId);
  }

  ProductById(String productId) async {
    return await FireStoreHelper.instence.productById(productId);
  }

  addToBasket(String productId) async {
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .basket!
        .add(productId);
    await FireStoreHelper.instence.updateUser();
    fillBasket();
  }

  updateUser() async {
    chagneLoading();
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .userName = userNameController.text;
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .email = emailNameController.text;
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .phone = phoneNameController.text;
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .address = addressNameController.text;
    Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
        .user!
        .imagePath = await updateImage();
    await FireStoreHelper.instence.updateUser();
    await Provider.of<DBprovider>(AppRouter.navKey.currentContext!,
            listen: false)
        .fillUser();

    selectedImage = null;
    chagneLoading();
    notifyListeners();
  }

  updateImage() async {
    if (selectedImage != null)
      return await FireStoreHelper.instence.uplaodImage(selectedImage!);

    return Provider.of<DBprovider>(AppRouter.navKey.currentContext!,
            listen: false)
        .user!
        .imagePath;
  }

  fillSelectedImage(XFile file) {
    selectedImage = File(file.path);
    notifyListeners();
  }

  clearData() {
    favorites.clear();
    favoriteProdcuts.clear();
    basket.clear();
    basketProducts.clear();
    notifyListeners();
  }

  chagneLoading() {
    loading = !loading;
    notifyListeners();
  }
}
