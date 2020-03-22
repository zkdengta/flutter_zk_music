import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///抽屉中的登陆模块，圆角
class LoginRadiusWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(ScreenUtil().setWidth(30))
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        color: const Color(0xFFFAFAFA),
        child: Column(
          children: <Widget>[
            Text(
              '手机电脑多端同步，尽享海量高品质音乐',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14.0),
              height: 30,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  onPressed: () {
//                  Navigator.pushNamed(context, pageLogin);
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text("立即登陆"))
            ),
          ],
        ),
      ),
    );
  }

}