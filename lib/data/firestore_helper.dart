import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/User.dart';

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
}
