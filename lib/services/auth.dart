import 'package:firebase_auth/firebase_auth.dart';
import 'package:mood_tracker_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//sign in with email and password

//register with email and password

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
