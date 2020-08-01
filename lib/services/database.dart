import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  //constructor sets uid
  DatabaseService({this.uid});

  final CollectionReference moodCollection =
      Firestore.instance.collection('moods');

  Future updateUserData(String name) async {
    return await moodCollection.document(uid).setData({
      'name': name,
    });
  }
}
