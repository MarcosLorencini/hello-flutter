import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //é definido 1x só no app
    return MaterialApp(
      //remove o bunner de debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      //define o widget a view
      home: HomePage(),
    );
  }
}


