import 'dart:io';

import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/data/firestore_helper.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FireStoreProvider extends ChangeNotifier {
  List<Product> products = [];
  List<dynamic> favorites = [];
  List<Product> favoriteProdcuts = [];

  FireStoreProvider() {
    readProductsCategory('NyC9FBzbJ34VeseCJLhj');
    fillFavorites();
  }
  readProductsCategory(String categoryId) async {
    products = await FireStoreHelper.instence.readCategoryProducts(categoryId);
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
