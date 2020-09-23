import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/choose_location.dart';
import 'screens/loading.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
