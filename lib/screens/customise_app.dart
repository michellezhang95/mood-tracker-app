import 'package:flutter/material.dart';
import 'package:mood_tracker_app/screens/home.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class customiseApp extends StatefulWidget {
  Color currentColor = Colors.purple[50];
  void changeTheme(Color color) {
    //method to change appbar color
    print(color);
    this.currentColor = color;
  }

  @override
  _customiseAppState createState() => _customiseAppState();
}

class _customiseAppState extends State<customiseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeList(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Account Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: customiseApp().currentColor,
      ),
    );
  }
}

class ThemeList extends StatefulWidget {
  @override
  _ThemeListState createState() => _ThemeListState();
}

class _ThemeListState extends State<ThemeList> {
  final List<Color> themes = <Color>[Colors.red, Colors.orange];
  final List<String> settings = <String>['Update Profile', 'Change Theme'];
  Color currentTheme;

  //final int colorCode = 300;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallWidth = width * 0.95;
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: themes.length,
      itemBuilder: (BuildContext context, int index) {
        return Align(
          child: SizedBox(
            width: width > 600 ? 600 : smallWidth,
            child: Container(
              height: 50.0,
              color: themes.elementAt(index),
              child: FlatButton(
                onPressed: () {
                  if (index == 0) {
                    print(themes.elementAt(index));
                  }
                },
                child: Text(
                  settings.elementAt(index),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
//dark/light theme
//set colour for light theme
//change user name (firebase)
