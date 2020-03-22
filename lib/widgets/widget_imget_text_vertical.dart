import 'package:flutter/material.dart';

///垂直模式，图标-文本

class ImageTextVerticalWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final GestureTapCallback onTap;

  ImageTextVerticalWidget({@required this.iconData, @required this.text,this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.red,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 12.0, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
