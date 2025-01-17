import 'package:flutter/material.dart';

class ErrorConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 228,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/images/no-internet.png',
              width: 124,
            ),
            SizedBox(
              height: 24,
            ),
            Text("You are lost in space",
                style: TextStyle(
                    fontSize: 24, color: Theme.of(context).primaryColor)),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Please turn on Internet",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                  height: 1.6),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
