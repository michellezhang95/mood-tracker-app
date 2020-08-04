import 'package:flutter/material.dart';

class NewEntry extends StatefulWidget {
  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SizedBox(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text('How are you feeling today?',
                  style: TextStyle(fontSize: 25.0)),
            ),
            SizedBox(height: 2.0),
          ],
        ),
      ),
    );
  }
}
