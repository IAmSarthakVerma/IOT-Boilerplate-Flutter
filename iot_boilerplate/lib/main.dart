import 'package:flutter/material.dart';
import 'package:iot_boilerplate/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  final routes = <String, WidgetBuilder>{

    HomePage.tag: (context) => HomePage(),

  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Smart Switch',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primaryColorDark: Colors.blueAccent,
        primaryColorLight: Colors.blue,
        accentColor: Colors.white,
        canvasColor: Color(0xFFf9f9f9),
      ),
      color: Colors.white,
      home: HomePage(),
      routes: routes,
    );
  }
}