import 'package:flutter/material.dart';
import 'package:mood_tracker_app/screens/home.dart';

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
        title: Text('Account Settings'),
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
  Color currentTheme;
  //final int colorCode = 300;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: themes.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50.0,
          color: themes.elementAt(index),
          child: FlatButton(
            onPressed: () {
              currentTheme = themes.elementAt(index);
              print(currentTheme);
              //call method in customiseApp to change appbar colour
              customiseApp().changeTheme(currentTheme);
            },
            child: Text(
              'Set colour',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
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
