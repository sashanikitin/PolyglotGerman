import 'package:flutter/material.dart';

import 'UI/first_page.dart';
import 'UI/main_page.dart';

//--no-sound-null-safety

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning German',
      theme: ThemeData(
        brightness: Brightness.light,

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,

      ),
      themeMode: ThemeMode.dark,

      home: MainRoute(),
    );
  }
}


