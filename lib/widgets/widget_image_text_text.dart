import 'package:flutter/material.dart';

/// 水平模式 图标-文本-文本
class ImageTextTextWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String message;
  final GestureTapCallback onTap;

  ImageTextTextWidget(
      {Key key,
      @required this.icon,
      @required this.label,
      this.message,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        child:Container(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(right: 4.0),
              ),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Offstage(
                offstage: message == null,
                child: Text(
                  message == null ? '' : message,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
