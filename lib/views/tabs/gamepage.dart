import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> directLinks;
  List<String> imageList;
  String imageBase = "assets/images/";
  @override
  void initState() {
    super.initState();

    directLinks = [
      "https://amazon.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://snapdeal.com",
      "https://amazon.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://snapdeal.com",
    ];
    imageList = [
      "s0.jpg",
      "s1.jpg",
      "s2.jpg",
      "s3.jpg",
      "s4.jpg",
      "s5.jpg",
      "m4.png",
      "s0.jpg",
      "s1.jpg",
      "s2.jpg",
      "s3.jpg",
      "s4.jpg",
      "s5.jpg",
      "m4.png"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Game Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return GridView.builder(
              itemCount: directLinks.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                String imageAddress = imageBase + imageList[index];
                return new Card(
                    child: new InkResponse(
                  child: Image.asset(imageAddress),
                  onTap: () {
                    // print(index);
                    openUrl(directLinks[index]);
                  },
                ));
              });
        }));
  }
}

void openUrl(String url) {
  launch(url);
}
