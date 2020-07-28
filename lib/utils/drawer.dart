import 'package:flutter/material.dart';
import 'package:smart_browser/views/history.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              trailing: Icons.keyboard_arrow_right),
          // _createDrawerItem(
          //   icon: Icons.menu,
          //   text: 'Menu',
          // ),
          _createDrawerItem(
            icon: Icons.history,
            text: 'History',
            trailing: Icons.keyboard_arrow_right,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HistoryPage()));
            },
          ),
          _createDrawerItem(
              icon: Icons.favorite,
              text: 'My Favourite',
              trailing: Icons.keyboard_arrow_right),
          _createDrawerItem(
              icon: Icons.feedback,
              text: 'Feedback',
              trailing: Icons.accessibility),
          _createDrawerItem(
              icon: Icons.help,
              text: 'Need Help ?',
              trailing: Icons.keyboard_arrow_right),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/drawer_background.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Smart Browser",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon,
      String text,
      GestureTapCallback onTap,
      IconData trailing}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
          Spacer(),
          Icon(trailing)
        ],
      ),
      onTap: onTap,
    );
  }
}
