import 'package:flutter/material.dart';

class Tema {
  criaTema() {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 32.0, fontStyle: FontStyle.italic),
            headline3: TextStyle(fontSize: 14.0, fontFamily: 'Wind')));
  }
}
