import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mood_tracker_app/authenticate/authenticate.dart';

//this wrapper will determine which screen is displayed
// sign in or register

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //access user data from provider every time user auth changes
    final user = Provider.of<User>(context);
    //if null go to login screen else go to dashboard
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
