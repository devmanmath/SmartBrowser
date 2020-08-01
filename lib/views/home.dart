import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_browser/utils/drawer.dart';
import 'package:smart_browser/utils/webview_placeholder.dart';
import 'package:smart_browser/views/popupmenu.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<String> courses = [
  //   'Back',
  //   'Setting',
  //   'Share',
  //   'Bookmark',
  //   'Desktop site'
  // ];
  // String selectedCourse = 'back';
  TextEditingController controller = TextEditingController();
  FocusNode _urlinput;
  WebViewController _viewController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int progress = 0;
  var urlString = "https://google.com";
  final key = UniqueKey();
  launchUrl() {
    setState(() {
      String urltext = controller.text.trim();
      if (urltext.contains("http"))
        print(urltext);
      else
        print("not a valid  url");
      urlString = controller.text.trim();
      // _urlinput.unfocus();
    });
    print(urlString);
    try {
      _viewController.loadUrl(urlString);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          child: _customAppbar(statusbarHeight),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        // appBar: AppBar(
        //     backgroundColor: Colors.blue,
        //     title: TextField(
        //       autofocus: false,
        //       controller: controller,
        //       cursorColor: Colors.white,
        //       cursorWidth: 0.3,
        //       textInputAction: TextInputAction.go,
        //       onSubmitted: (url) => launchUrl(),
        //       style: TextStyle(color: Colors.black),
        //       focusNode: _urlinput,
        //       decoration: InputDecoration(
        //         contentPadding: EdgeInsets.all(10.0),
        //         filled: true,
        //         fillColor: Colors.lightBlueAccent,
        //         prefix: Text('https://'),
        //         border: OutlineInputBorder(
        //             borderSide: BorderSide.none,
        //             borderRadius: BorderRadius.circular(10.0)),
        //         hintText: "Ënter Url here",
        //         suffixIcon: IconButton(
        //           icon: Icon(Icons.clear),
        //           onPressed: () => controller.clear(),
        //         ),
        //         hintStyle: TextStyle(color: Colors.black),
        //       ),
        //     ),
        //     actions: <Widget>[PopupMenuPage()]
        //     ),
        drawer: CustomDrawer(),
        body: WebView(
          initialUrl: urlString,
          onWebViewCreated: (WebViewController webViewController) {
            _viewController = webViewController;
          },
          onPageStarted: (String url) {
            print('your url $url');
          },
        ));
  }

  Widget _customAppbar(double sheight) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: sheight,
            left: 3.0,
            right: 3.0,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1.0),
                    color: Colors.white),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print("your menu action here");
                        _scaffoldKey.currentState.openDrawer();
                        // Scaffold.of(context).openDrawer();
                      },
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        controller: controller,
                        focusNode: _urlinput,
                        onSubmitted: (url) => launchUrl(),
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefix: Text('https://'),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print("your menu action here");
                        launchUrl();
                      },
                    ),
                    PopupMenuPage()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
