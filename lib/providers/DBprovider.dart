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
  DBprovider() {
    fillUser();
  }
  fillUser() async {
    this.user = await DBhelper.instance.CheckUser();
    notifyListeners();
  }

  signIn() async {
    await DBhelper.instance
        .signIn(emailControllerLogin.text, passwordControllerLogin.text);
    this.user = await DBhelper.instance.CheckUser();

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
}
