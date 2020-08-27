import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopingPage extends StatefulWidget {
  @override
  _ShopingPageState createState() => _ShopingPageState();
}

class _ShopingPageState extends State<ShopingPage> {
  List<String> directLinks;
  List<String> imageList;
  String imageBase = "assets/images/";
  @override
  void initState() {
    super.initState();

    directLinks = [
      "https://amazon.com",
      "https://lifestyle.com",
      "https://limeroad.com",
      "https://maxfashion.com",
      "https://myntra.com",
      "https://nykaa.com",
      "https://olx.com",
      "https://selmaro.com",
      "https://snapdeal.com",
      "https://zara.com",
      "https://aliexpress.com",
      "https://hyperpure.com",
      "https://voonik.com",
      "https://quikr.com",
      "https://justdial.com",
    ];
    imageList = [
      "samazon.png",
      "slifestyle.jpg",
      "slimeroad.jpg",
      "smax.jpg",
      "smyntra.jpg",
      "snykaa.jpg",
      "solx.jpg",
      "sselmaro.jpg",
      "ssnapdeal.jpg",
      "szara.jpg",
      "saliexpress.jpg",
      "shyperpure.jpg",
      "svoonik.jpg",
      "squikr.jpg",
      "sjustdial.jpg",
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
