import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/model/Category.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MethodProvider {
  CheckFavoriteState(String productId) {
    return Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .favorites
        .contains(productId);
  }
}
