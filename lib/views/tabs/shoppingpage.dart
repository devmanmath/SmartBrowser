import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopingPage extends StatefulWidget {
  @override
  _ShopingPageState createState() => _ShopingPageState();
}

class _ShopingPageState extends State<ShopingPage> {
  // List<String> images = [
  //   "assets/images/s0.jpg",
  //   "assets/images/s1.jpg",
  //   "assets/images/s2.jpg",
  //   "assets/images/s3.jpg",
  //   "assets/images/s4.jpg",
  //   "assets/images/s5.jpg",
  //   "assets/images/s6.jpg"
  // ];
  // int _currentIndex = 0;
  List<String> directLinks;
  @override
  void initState() {
    super.initState();

    directLinks = [
      'amazon', 'flipkart', 'flipkart', 'flipkart', 'amazon', 'snapdeal',
      'flipkart'
      // "https://amazon.com",
      // "https://flipkart.com",
      // "https://flipkart.com",
      // "https://flipkart.com",
      // "https://flipkart.com",
      // "https://flipkart.com",
      // "https://snapdeal.com",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Shopping Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return GridView.builder(
              itemCount: 7,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    child: new InkResponse(
                  child: Image.asset('assets/images/s$index.jpg'),
                  onTap: () {
                    // print(index);
                    openUrl("https://amazon.com");
                  },
                ));
              });
        }));
  }
}

openUrl(String url) {
  launch(url);
}
