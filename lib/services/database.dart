import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  //constructor sets uid
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final CollectionReference entryCollection =
      Firestore.instance.collection('entries');
  // this method updates the user data within firebase cloud firestore
  //each time a user registers their name is saved into the 'users' collection

  Future updateUserData(String name) async {
    return await userCollection.document(uid).setData({
      'name': name,
    });
  }

  Future updateUserEntry(String mood) {}
}
