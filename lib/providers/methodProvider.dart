import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/model/User.dart';
import 'package:e_commerce_app/providers/DBprovider.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MethodProvider {
  CheckFavoriteState(String productId) {
    return Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .favorites
        .contains(productId);
  }

  getBasketPrice() {
    int totalPrice = 0;
    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!)
        .basketProducts
        .forEach((element) {
      totalPrice += element.price;
    });
    return totalPrice;
  }

  fillControllers() {
    AppUser? user =
        Provider.of<DBprovider>(AppRouter.navKey.currentContext!, listen: false)
            .user;

    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .userNameController
        .text = user!.userName!;
    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .emailNameController
        .text = user.email!;
    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .phoneNameController
        .text = user.phone ?? "No Phone Number";
    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .addressNameController
        .text = user.address ?? 'No Address';
  }

  getFile() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .fillSelectedImage(file!);
  }
}
