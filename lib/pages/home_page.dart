import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterzkmusic/widgets/widget_image_text_text.dart';
import 'package:flutterzkmusic/widgets/widget_login_radius.dart';
import 'package:flutterzkmusic/widgets/widget_imget_text_vertical.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: _Drawer(),
      appBar: AppBar(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black38,
            margin: EdgeInsets.only(bottom: 46),
            child: ListView(
              children: <Widget>[
                LoginRadiusWidget(),
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ImageTextVerticalWidget(
                        iconData: Icons.message,
                        text: '我的消息',
                      ),
                      ImageTextVerticalWidget(
                        iconData: Icons.phone,
                        text: '我的好友',
                      ),
                      ImageTextVerticalWidget(
                        iconData: Icons.phone,
                        text: '个人主页',
                      ),
                      ImageTextVerticalWidget(
                        iconData: Icons.phone,
                        text: '个性装扮',
                      ),
                    ],
                  )
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        height: 0.5,
                      )),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.keyboard_voice,
                    label: '听歌识曲',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '演出',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '商城',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.location_on,
                    label: '附近的人',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '游戏推荐',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '口袋彩铃',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        height: 0.5,
                      )),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '我的订单',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '定时停止播放',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '扫一扫',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.notifications_active,
                    label: '音乐闹钟',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '在线听歌免流量',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '优惠劵',
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '青少年模式',
                    message: '未开启',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Divider(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ImageTextTextWidget(
                            icon: Icons.brightness_2,
                            label: '夜间模式',
                          ),
                          ImageTextTextWidget(
                            icon: Icons.settings,
                            label: '设置',
                          ),
                          ImageTextTextWidget(
                            icon: Icons.power_settings_new,
                            label: '退出',
                          ),
                        ],
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
