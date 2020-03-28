import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///栏目名

class ColumnWidget extends StatelessWidget {
  final String title;
  final String leftText;
  final String rightText;
  final IconData icon;
  final VoidCallback onTap;

  ColumnWidget(
      {@required this.title,
      @required this.leftText,
      @required this.rightText,
      this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
          child: Text(
            title,
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  leftText,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Container(
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300], width: 0.5),
                  // 边色与边宽度
                  borderRadius: BorderRadius.circular(20), // 圆角度
                ),
                child: FlatButton.icon(
                  padding: EdgeInsets.zero,
                  onPressed: onTap,
                  label: Text(
                    rightText,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                  icon: Offstage(
                    offstage: icon == null,
                    child: Icon(
                      icon,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
