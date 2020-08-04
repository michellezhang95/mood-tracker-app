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
  Future updateUserData(String name, String accType) async {
    return await userCollection
        .document(uid)
        .setData({'name': name, 'account type': accType});
  }

  //database update for new journal entry
  Future updateUserEntry(String mood) async {
    return await entryCollection.document(uid).setData({
      'entry': mood,
    });
  }
}
