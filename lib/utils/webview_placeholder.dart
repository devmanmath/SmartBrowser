import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebviewPlaceholder extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  var url = 'https://www.google.com';
  final key = UniqueKey();

  WebviewPlaceholder(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
        key: key,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        });
  }
}
