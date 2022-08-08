import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  static SharedPreferences? sp;
  static initS() async {
    sp = await SharedPreferences.getInstance();
  }

  static newUserToOldUser() {
    sp!.setBool('olduser', true);
  }

  static bool? readNewUser() {
    return sp!.getBool('olduser');
  }
}
