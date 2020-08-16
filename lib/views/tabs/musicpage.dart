import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List<String> directLinks;
  List<String> imageList;
  String imageBase = "assets/images/";
  @override
  void initState() {
    super.initState();

    directLinks = [
      "https://hungama.com",
      "https://gaana.com",
      "https://music.apple.com",
      "https://wynk.in/music",
      "https://jiosaavn.com",
      "https://music.amazon.com",
      "https://open.spotify.com",
      "https://m.starmakerstudios.com",
      "https://mxplayer.in/music-online",
      "https://m.starmakerstudios.com",
      "https://mxplayer.in/music-online/",
      "https://flipkart.com",
      "https://flipkart.com",
      "https://snapdeal.com",
      "https://music.youtube.com"
    ];
    imageList = [
      "mhungama.jpg",
      "mgaana.jpg",
      "mapplemusic.jpg",
      "mwynkmusic.jpg",
      "mjiosaavn.jpg",
      "mamazonmusic.jpg",
      "mspotifylite.jpg",
      "mstarmaker.jpg",
      "mxplayer.jpg",
      "mimusic.jpg",
      "musicplay.jpg",
      "msamsung.jpg",
      "musicmatch.jpg",
      "mPimusic.jpg",
      "myoutube.jpg"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Music page",
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
