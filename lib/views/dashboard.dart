import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_browser/views/home.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static double _tabBarIconSize = 24.0;
  List<StatefulWidget> _tabs;
  StatefulWidget _defaultTab;
  int lastIndex = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _defaultTab = Home();
    _tabs = [
      Home(),
      Home(),
      Home(),
      Home(),
      Home(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      //  lastIndex=_currentIndex;
      _currentIndex = index;
      _defaultTab = _tabs[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          bottomNavigationBar: _bottomNavigationBar(),
          body: Builder(
            builder: (context) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: _defaultTab,
              ),
            ),
          )),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        onTap: _onTabTapped,
        backgroundColor: Colors.white30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24.0,
            ),
            title: Text('Home',
                style: TextStyle(color: Colors.black45, fontSize: 15)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.memory,
              size: 24.0,
            ),
            title: Text('About',
                style: TextStyle(color: Colors.black45, fontSize: 15)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time,
              size: 24.0,
            ),
            title: Text('New',
                style: TextStyle(color: Colors.black45, fontSize: 15)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
              size: 24.0,
            ),
            title: Text('Music',
                style: TextStyle(color: Colors.black45, fontSize: 15)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              size: 24.0,
            ),
            title: Text('Video',
                style: TextStyle(color: Colors.black45, fontSize: 15)),
          )
        ]);
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Are you sure to exit Samart Browser ?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    })
              ],
            ));
  }
}
