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
    return Scaffold(
        appBar: AppBar(
            title: TextField(
              autofocus: false,
              controller: controller,
              cursorColor: Colors.white,
              cursorWidth: 0.3,
              textInputAction: TextInputAction.go,
              onSubmitted: (url) => launchUrl(),
              style: TextStyle(color: Colors.white),
              focusNode: _urlinput,
              decoration: InputDecoration(
                prefix: Text('https://'),
                border: OutlineInputBorder(),
                hintText: "Ënter Url here",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => controller.clear(),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            actions: <Widget>[PopupMenuPage()]
            //   IconButton(
            //       icon: Icon(Icons.navigate_next), onPressed: () => launchUrl()),
            //   PopupMenuButton(
            //     offset: Offset(0, 55),
            //     elevation: 10,
            //     itemBuilder: (context) {
            //       return courses.map((course) {
            //         return PopupMenuItem(
            //           value: course,
            //           child: Text(course),
            //         );
            //       }).toList();
            //     },
            //     onCanceled: () => print('nothing is selected'),
            //     onSelected: (value) {
            //       setState(() {
            //         selectedCourse = value;
            //       });
            //     },
            //   )
            // ],
            ),
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

    //   return WebviewScaffold(
    //     appBar: AppBar(
    //       leading: new IconButton(
    //           icon: new Icon(Icons.arrow_back),
    //           onPressed: () {
    //             flutterWebviewPlugin.canGoBack().then((value) {
    //               if (value) {
    //                 flutterWebviewPlugin.goBack();
    //               } else {
    //                 Navigator.pop(context);
    //               }
    //             });
    //           }),
    //       title: TextField(
    //         autofocus: true,
    //         controller: controller,
    //         cursorColor: Colors.white,
    //         cursorWidth: 0.3,
    //         textInputAction: TextInputAction.go,
    //         onSubmitted: (url) => launchUrl(),
    //         style: TextStyle(color: Colors.white),
    //         decoration: InputDecoration(
    //           border: InputBorder.none,
    //           hintText: "Ënter Url here",
    //           suffixIcon: IconButton(
    //             icon: Icon(Icons.clear),
    //             onPressed: () => controller.clear(),
    //           ),
    //           hintStyle: TextStyle(color: Colors.white),
    //         ),
    //       ),
    //       actions: <Widget>[
    //         IconButton(
    //             icon: Icon(Icons.navigate_next), onPressed: () => launchUrl()),
    //       ],
    //     ),
    //     url: urlString,
    //     withZoom: true,
    //   );
  }
}
