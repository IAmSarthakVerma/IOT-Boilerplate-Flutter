import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:iot_boilerplate/tabs/TabOne.dart';
import 'package:iot_boilerplate/tabs/TabTwo.dart';
import 'package:iot_boilerplate/tabs/TabThree.dart';
import 'package:flutter/services.dart';
import 'package:iot_boilerplate/util/const.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  List tabsList = [TabOne(), TabTwo(), TabThree()];

  TabController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = new TabController(length: 3, vsync: this);


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: WillPopScope(
          child: Scaffold(

            bottomNavigationBar: new Material(
              color: Constants.darkBG,
              child: new TabBar(
                  controller: _pageController,
                  indicatorColor: Constants.darkAccent,
                  labelColor: Constants.darkAccent,
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    new Tab(
                      icon: Icon(Feather.getIconData("home")),
                    ),
                    new Tab(
                      icon: Icon(Feather.getIconData("edit")),
                    ),
                    new Tab(
                      icon: Icon(Feather.getIconData("settings")),
                    ),
                  ]),
            ),

            body: new TabBarView(
              children: <Widget>[
                TabOne(),
                TabTwo(),
                TabThree(),
              ],
              controller: _pageController,
            ),
          ),
          onWillPop: _onWillPop),
    );
//      ),
//    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to close the app'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
