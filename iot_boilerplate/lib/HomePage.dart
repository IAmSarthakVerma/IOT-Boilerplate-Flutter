import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:iot_boilerplate/tabs/TabOne.dart';



class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: onPageChanged,
            children: List.generate(4, (index) => TabOne()),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Theme.of(context).primaryColor,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Theme.of(context).accentColor,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.grey[500]),
              ),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.getIconData("home"),
                  ),
                  title: Container(height: 0.0),
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.getIconData("heart"),
                  ),
                  title: Container(height: 0.0),
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.getIconData("user"),
                  ),
                  title: Container(height: 0.0),
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    Feather.getIconData("grid"),
                  ),
                  title: Container(height: 0.0),
                ),
              ],
              onTap: navigationTapped,
              currentIndex: _page,
            ),
          )
      ),
    );
  }
}