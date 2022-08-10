import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:provider/provider.dart';

class MethodProvider {
  CheckFavoriteState(String productId) {
    return Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .favorites
        .contains(productId);
  }
}
