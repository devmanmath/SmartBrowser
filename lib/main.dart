import 'package:flutter/material.dart';
import 'package:smart_browser/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Browser",
      theme:
          ThemeData(accentColor: Colors.red[50], backgroundColor: Colors.white),
      home: Home(),
    );
  }
}
