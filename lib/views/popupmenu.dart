import 'package:flutter/material.dart';
import 'package:smart_browser/views/home.dart';
import 'popmenuitem.dart';
import 'package:url_launcher/url_launcher.dart';

class PopupMenuPage extends StatefulWidget {
  @override
  _PopupMenuPageState createState() => _PopupMenuPageState();
}

class _PopupMenuPageState extends State {
  String choice = "Click Settings to make your selection";

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 50),
      elevation: 10,
      onSelected: (NavLinks value) {
        setState(() {
          //print the selected option
          print(value);

          //Update the current choice.
          choice = displayString(value);
        });
        // print(choice);
        launch(linkUrl(value));
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
