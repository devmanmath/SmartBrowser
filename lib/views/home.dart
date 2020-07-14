import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_browser/utils/drawer.dart';
import 'package:smart_browser/utils/webview_placeholder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  FocusNode _urlinput;
  var urlString = "https://google.com";
  final key = UniqueKey();
  launchUrl() {
    setState(() {
      urlString = controller.text;
      _urlinput.unfocus();
    });
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
              border: InputBorder.none,
              hintText: "Ënter Url here",
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => controller.clear(),
              ),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.navigate_next), onPressed: () => launchUrl())
          ],
        ),
        drawer: CustomDrawer(),
        body: WebviewPlaceholder(urlString));

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
