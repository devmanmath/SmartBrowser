import 'package:flutter/material.dart';
import 'package:smart_browser/utils/drawer.dart';
import 'package:smart_browser/views/popupmenu.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:smart_browser/views/history.dart';
import 'package:provider/provider.dart';
import 'package:smart_browser/model/database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  FocusNode _urlinput;
  WebViewController _viewController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<StatefulWidget> _tabs;
  StatefulWidget _defaultTab;
  int _currentIndex = 0;

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
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          child: _customAppbar(statusbarHeight, context),
          preferredSize: Size.fromHeight(kToolbarHeight),
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
          onPageFinished: (String url) {
            print('your end url is $url');
            setState(() {
              urlString = url;
              controller.text = url;
            });
            final iurl = Url(urladdress: urlString, dueDate: DateTime.now());
            database.insertUrl(iurl);
          },
        ));
  }

  Widget _customAppbar(double sheight, BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: sheight,
            left: 5.0,
            right: 5.0,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1.0),
                    color: Colors.white30),
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
                        onSubmitted: (url) {
                          launchUrl();
                        },
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
                    PopupMenuPage(urlString)
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
