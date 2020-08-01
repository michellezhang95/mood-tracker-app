import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_tracker_app/models/user.dart';
import 'package:mood_tracker_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

//sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      //make request to firebase
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(
          user); // returns uid from custom method we made
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('New User');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//sign out method, asynchronous because we wait for this event to happen
//i.e. when the user clicks signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
