import 'package:flutter/material.dart';
import 'package:iot_boilerplate/HomePage.dart';
import 'package:iot_boilerplate/util/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  final routes = <String, WidgetBuilder>{

    HomePage.tag: (context) => HomePage(),

  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: Constants.darkTheme,
      color: Colors.white,
      home: HomePage(),
      routes: routes,
    );
  }
}