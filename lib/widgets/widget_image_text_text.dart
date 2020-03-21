import 'package:flutter/material.dart';

/// 水平模式 图标-文本-文本
class ImageTextTextWidget extends StatelessWidget{

  final IconData icon;
  final String label;
  final String message;

  ImageTextTextWidget({
    Key key,
    @required this.icon,
    @required this.label,
    this.message
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.grey,),
          Padding(padding: EdgeInsets.only(right: 4.0),),
          Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
              ),
            ),
          Offstage(
            offstage: message == null,
            child: Text(
              message == null?'':message,
              style: TextStyle(
                color: Colors.grey
              ),
            ),
          )
        ],
      ),
    );
  }

}