import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<String> directLinks;
  List<String> imageList;
  String imageBase = "assets/images/";
  @override
  void initState() {
    super.initState();

    directLinks = [
      "https://facebook.com",
      "https://instagram.com",
      "https://linkedin.com",
      "https://netflix.com",
      "https://twitter.com",
      "https://zomato.com",
      "https://swiggy.com",
      "https://quora.com",
      "https://sulekha.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://snapdeal.com",
    ];
    imageList = [
      "tfacebook.jpg",
      "tinsta.jpg",
      "tlinked.jpg",
      "tnetflix.jpg",
      "twitter.jpg",
      "tzomato.jpg",
      "tswiggy.jpg",
      "tquora.jpg",
      "tsulekha.jpg",
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
            "Top Sites",
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
