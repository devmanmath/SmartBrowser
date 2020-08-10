import 'package:flutter/material.dart';
import 'package:smart_browser/views/dashboard.dart';
import 'package:provider/provider.dart';

import 'model/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return Provider(
        builder: (_) => AppDatabase(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Smart Browser",
          theme: ThemeData(
              accentColor: Colors.red[50], backgroundColor: Colors.white),
          home: Dashboard(),
        ));
  }
}
