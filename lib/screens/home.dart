import 'package:flutter/material.dart';
import 'package:mood_tracker_app/services/auth.dart';
import 'package:mood_tracker_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:mood_tracker_app/screens/customise_app.dart';
import 'package:mood_tracker_app/screens/calendar.dart';
import 'package:mood_tracker_app/segments/new_entry.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('This is a snackbar'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Settings', style: TextStyle(fontSize: 55.0)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Account Settings'),
              onTap: () {
                //go to theme change screen
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => customiseApp()));
              },
            ),
            ListTile(
              title: Text('Clear list'),
              onTap: () {
                //clear list of all elements
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0.0,
        title: Text('Welcome'),
        //gradient: LinearGradient(colors: null),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _auth.signOut();
              }),
          IconButton(
              icon: const Icon(Icons.create),
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              }),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: null,
          ),
          IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Calendar()));
              }),
        ],
      ),
      body: NewEntry(), //display prompt for user entry
    );
  }
}
