import 'package:e_commerce_app/AppRouter/AppRouter.dart';
import 'package:e_commerce_app/Screens/HomePage.dart';
import 'package:e_commerce_app/Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBhelper {
  static DBhelper instance = DBhelper._();

  DBhelper._();

  singUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      AppRouter.pushWithReplacment(LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AppRouter.pushWithReplacment(HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    AppRouter.pushWithReplacment(LoginScreen());
  }

  CheckUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    return user;
  }
}
