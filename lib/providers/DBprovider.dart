import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/DBHelper/Dbhelper.dart';
import 'package:e_commerce_app/SPHelper/SPHelper.dart';
import 'package:e_commerce_app/Screens/HomePage.dart';
import 'package:e_commerce_app/Screens/LoginScreen.dart';
import 'package:e_commerce_app/Screens/SplachScreen.dart';
import 'package:e_commerce_app/data/firestore_helper.dart';
import 'package:e_commerce_app/model/User.dart';
import 'package:e_commerce_app/providers/FireStoreProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DBprovider extends ChangeNotifier {
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  TextEditingController emailControllerSignup = TextEditingController();
  TextEditingController passwordControllerSignup = TextEditingController();
  TextEditingController userNameControllerSignup = TextEditingController();
  TextEditingController phoneControllerSignup = TextEditingController();
  AppUser? user;
  String imageUrl =
      "https://firebasestorage.googleapis.com/v0/b/e-commrec-app.appspot.com/o/user.png?alt=media&token=dcb96c48-d0a3-4245-b42d-40ba4c3a5c36";
  DBprovider() {
    fillUser();
  }
  fillUser() async {
    var uid2 = await DBhelper.instance.getCurrentUserId();
    this.user = await FireStoreHelper.instence.readUserFromFireBase(uid2);

    notifyListeners();
  }

  signIn() async {
    await DBhelper.instance
        .signIn(emailControllerLogin.text, passwordControllerLogin.text);

    var uid2 = await DBhelper.instance.getCurrentUserId();
    this.user = await FireStoreHelper.instence.readUserFromFireBase(uid2);
    await Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .fillData();
    notifyListeners();
  }

  signUp() async {
    UserCredential userCredential = await DBhelper.instance
        .singUp(emailControllerSignup.text, passwordControllerSignup.text);
    FireStoreHelper.instence.addUserToFireBase(AppUser(
        id: userCredential.user!.uid,
        email: userCredential.user!.email,
        userName: userNameControllerSignup.text,
        phone: phoneControllerSignup.text,
        imagePath: imageUrl));
    print(phoneControllerSignup.text);
    AppRouter.pushWidget(LoginScreen());
  }

  signOut() {
    Provider.of<FireStoreProvider>(AppRouter.navKey.currentContext!,
            listen: false)
        .clearData();
    DBhelper.instance.signOut();
  }

  checkUser() async {
    user = await DBhelper.instance.CheckUser();
    if (user == null)
      AppRouter.pushWithReplacment(LoginScreen());
    else
      AppRouter.pushWithReplacment(HomePage());
  }

  getUser() async {
    return await DBhelper.instance.CheckUser();
  }

  checkAppUser() {
    bool? res = SPHelper.readNewUser();
    print(res);
    if (res == null) {
      SPHelper.newUserToOldUser();
      return SplachScreen();
    }
    return user == null ? LoginScreen() : HomePage();
  }

  resetPassword() async {
    await DBhelper.instance.resetPassword(emailControllerLogin.text);
    AppRouter.pushWithReplacment(LoginScreen());
  }

  getUserId() async {
    return await DBhelper.instance.getCurrentUserId();
  }
}
