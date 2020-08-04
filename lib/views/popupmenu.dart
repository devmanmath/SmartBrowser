import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:smart_browser/views/home.dart';

enum NavLinks { Back, Setting, Share, Bookmark, DesktopSite }

class PopupMenuPage extends StatefulWidget {
  final String shareUrl;
  const PopupMenuPage(this.shareUrl);

  @override
  _PopupMenuPageState createState() => _PopupMenuPageState();
}

class _PopupMenuPageState extends State<PopupMenuPage> {
  String choice = "Click Settings to make your selection";
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: Colors.red),
      offset: Offset(0, 40),
      elevation: 10,
      onSelected: (NavLinks value) {
        setState(() {
          //print the selected option
          print(value);

          //Update the current choice.
          choice = displayString(value);
        });
        // print(choice);
        // launch(linkUrl(value));
        shareitem(value, context);
      },
      itemBuilder: (BuildContext context) {
        return NavLinks.values.map((link) {
          return PopupMenuItem(
            value: link,
            child: Text(displayString(link)),
          );
        }).toList();
      },
    );
  }

  void shareitem(NavLinks link, BuildContext context) {
    switch (link) {
      case NavLinks.Back:
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Home()));
        break;

      case NavLinks.Setting:
        break;
      case NavLinks.Share:
        final RenderBox box = context.findRenderObject();
        Share.share("${widget.shareUrl}",
            subject: "",
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        break;

      case NavLinks.Bookmark:
        break;
      case NavLinks.DesktopSite:
        break;

      default:
    }
  }

  String displayString(NavLinks link) {
    switch (link) {
      case NavLinks.Back:
        return "Back";
        // Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (BuildContext context) => Home()));
        break;

      case NavLinks.Setting:
        return "Setting";
        break;
      case NavLinks.Share:
        return "Share";
        break;

      case NavLinks.Bookmark:
        return "Bookmark";
        break;
      case NavLinks.DesktopSite:
        return "Desktop Site";
        break;

      default:
        return "";
    }
  }
}

// class PopupMenuPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _PopupMenuButtonWidgetState();
// }

// class _PopupMenuButtonWidgetState extends State {
//   String choice = "Click Settings to make your selection";

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       offset: Offset(0, 50),
//       elevation: 10,
//       onSelected: (NavLinks value) {
//         setState(() {
//           //print the selected option
//           print(value);

//           //Update the current choice.
//           choice = displayString(value);
//         });
//         // print(choice);
//         // launch(choice);
//       },
//       itemBuilder: (BuildContext context) {
//         return NavLinks.values.map((link) {
//           return PopupMenuItem(
//             value: link,
//             child: Text(displayString(link)),
//           );
//         }).toList();
//       },
//     );
//   }
// }
