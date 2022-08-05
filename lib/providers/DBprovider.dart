import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/DBHelper/Dbhelper.dart';
import 'package:e_commerce_app/SPHelper/SPHelper.dart';
import 'package:e_commerce_app/Screens/HomePage.dart';
import 'package:e_commerce_app/Screens/LoginScreen.dart';
import 'package:e_commerce_app/Screens/SplachScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DBprovider extends ChangeNotifier {
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  TextEditingController emailControllerSignup = TextEditingController();
  TextEditingController passwordControllerSignup = TextEditingController();
  User? user;

  signIn() async {
    DBhelper.instance
        .signIn(emailControllerLogin.text, passwordControllerLogin.text);
    user = await DBhelper.instance.CheckUser();
    print(user!.email);
    notifyListeners();
  }

  signUp() {
    DBhelper.instance
        .singUp(emailControllerSignup.text, passwordControllerSignup.text);
  }

  signOut() {
    DBhelper.instance.signOut();
  }

  checkUser() async {
    user = await DBhelper.instance.CheckUser();
    if (user == null)
      AppRouter.pushWithReplacment(LoginScreen());
    else
      AppRouter.pushWithReplacment(HomePage());
    notifyListeners();
  }

  getUser() async {
    return await DBhelper.instance.CheckUser();
  }

  checkAppUser() {
    bool? res = SPHelper.readNewUser();
    if (res == null) {
      SPHelper.newUserToOldUser();
      return SplachScreen();
    }
    return getUser() == null ? LoginScreen() : HomePage();
  }
}
