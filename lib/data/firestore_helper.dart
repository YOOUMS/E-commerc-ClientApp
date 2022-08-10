import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/model/Product.dart';
import 'package:e_commerce_app/model/User.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FireStoreHelper {
  static FireStoreHelper instence = FireStoreHelper._();
  FireStoreHelper._();
  addUserToFireBase(AppUser user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.id)
        .set(user.toMap());
  }

  readUserFromFireBase(String id) async {
    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return AppUser.fromJson(user.data()!);
  }

  readCategoryProducts(String categoryId) async {
    CollectionReference<Map<String, dynamic>> productsRef =
        await FirebaseFirestore.instance.collection('products');
    QuerySnapshot<Map<String, dynamic>> products =
        await productsRef.where('categoryId', isEqualTo: categoryId).get();
    List<Product> productsList = [];
    products.docs.forEach((element) {
      Product productToAdd = Product.fromMap(element.data());
      productToAdd.id = element.id;
      productsList.add(productToAdd);
    });
    return productsList;
  }

  // addToFavorite(String userId){
  //   FirebaseFirestore.instance.collection('users').doc(userId).update(data)
  // }

  readFavorites(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> user =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    Map<String, dynamic>? userData = user.data();

    return userData!['favorites'];
  }

  addToFavorites() async {
    AppUser? user = await Provider.of<DBprovider>(
            AppRouter.navKey.currentContext!,
            listen: false)
        .user;
    String userId = await Provider.of<DBprovider>(
            AppRouter.navKey.currentContext!,
            listen: false)
        .getUserId();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(user!.toMap());
  }
}
