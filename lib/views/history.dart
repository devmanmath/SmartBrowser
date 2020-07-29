import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Future<List> history;
  bool isSearching = false;
  // Future<List> gethistory() async {
  //   var response = await Dio().get('urlstring ');
  //   return response.data;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: !isSearching
            ? Text('History')
            : TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: " search history here",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  })
        ],
      ),
      body: Container(
        color: Colors.white,
        child: (Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Your Google Acount may have other browsing history at ',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  child: Text('myactivity.google.com \n\n\n',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    openUrl("http://myactivity.google.com");
                  },
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  child: Text(' Clear browsing data....',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    openUrl("http://youtube.com");
                  },
                ),
                Divider(
                  color: Colors.black,
                )
              ],
            ))
          ],
        )),
      ),
    );
  }

  openUrl(String url) {
   // String url1 = url;
    launch(url);
  }
}
