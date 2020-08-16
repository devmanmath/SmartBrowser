import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_browser/utils/error_connection.dart';
import 'package:smart_browser/views/tabs/homepage.dart';
import 'package:smart_browser/views/tabs/musicpage.dart';
import 'package:smart_browser/views/tabs/videopage.dart';
import 'package:smart_browser/views/tabs/gamepage.dart';
import 'package:smart_browser/views/tabs/shoppingpage.dart';
import 'package:connectivity/connectivity.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<StatefulWidget> _tabs;
  StatefulWidget _defaultTab;
  int _currentIndex = 0;
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _defaultTab = HomePage();
    _tabs = [HomePage(), MusicPage(), VideoPage(), GamePage(), ShopingPage()];

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print(result);
      if (result != ConnectivityResult.none) {
        _connectionStatus = true;
      } else {
        _connectionStatus = false;
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottmnavBar(),
      body: Builder(
        builder: (context) => Center(
            child: _connectionStatus
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: _defaultTab,
                  )
                : ErrorConnection()),
      ),
    );
  }

  Widget _bottmnavBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.red[600],
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            title: Text('Music'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('Topsites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            title: Text('Game'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scatter_plot),
            title: Text('Shopping'),
          ),
        ]);
  }

  void _onTabTapped(int index) {
    setState(() {
      //  lastIndex=_currentIndex;
      _currentIndex = index;
      _defaultTab = _tabs[index];
    });
  }
}
