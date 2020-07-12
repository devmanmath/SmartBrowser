import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:smart_browser/utils/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://google.com";
  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: TextField(
    //       autofocus: true,
    //       controller: controller,
    //       cursorColor: Colors.white,
    //       cursorWidth: 0.3,
    //       textInputAction: TextInputAction.go,
    //       onSubmitted: (url) => launchUrl(),
    //       style: TextStyle(color: Colors.white),
    //       decoration: InputDecoration(
    //         border: InputBorder.none,
    //         hintText: "Ënter Url here",
    //         suffixIcon: IconButton(
    //           icon: Icon(Icons.clear),
    //           onPressed: () => controller.clear(),
    //         ),
    //         hintStyle: TextStyle(color: Colors.white),
    //       ),
    //     ),
    //     actions: <Widget>[
    //       IconButton(
    //           icon: Icon(Icons.navigate_next), onPressed: () => launchUrl())
    //     ],
    //   ),
    //   drawer: CustomDrawer(),
    //   body: WebviewScaffold(
    //     url: urlString,
    //     withZoom: true,
    //   ),
    // );

    return WebviewScaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              flutterWebviewPlugin.canGoBack().then((value) {
                if (value) {
                  flutterWebviewPlugin.goBack();
                } else {
                  Navigator.pop(context);
                }
              });
            }),
        title: TextField(
          autofocus: true,
          controller: controller,
          cursorColor: Colors.white,
          cursorWidth: 0.3,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
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
              icon: Icon(Icons.navigate_next), onPressed: () => launchUrl()),
        ],
      ),
      url: urlString,
      withZoom: true,
    );
  }
}
