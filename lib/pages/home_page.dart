import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterzkmusic/widgets/widget_image_text_text.dart';
import 'package:flutterzkmusic/widgets/widget_login_radius.dart';
import 'package:flutterzkmusic/widgets/widget_imget_text_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzkmusic/widgets/v_empty_view.dart';
import 'package:flutterzkmusic/application.dart';

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
      appBar: AppBar(
        elevation: 0, // 隐藏阴影
        title: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: TabBar(
            labelPadding: EdgeInsets.all(0),
            controller: _tabController,
            indicator: UnderlineTabIndicator(),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16,
            ),
            tabs: <Widget>[
              Tab(
                text: '我的',
              ),
              Tab(
                text: '发现',
              ),
              Tab(
                text: '云村',
              ),
              Tab(
                text: '视频',
              ),
            ],
          ),
        ),
        titleSpacing: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: TabBarView(
                controller: _tabController,
                children: [
                  Text('1'),
                  Text('1'),
                  Text('1'),
                  Text('1'),
                ],
              ),
      ),
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
            margin: EdgeInsets.only(bottom: 46),
            child: ListView(
              children: <Widget>[
                  Container(
                    color: Colors.black38,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 150.0,
                          child: Container(
                            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(ScreenUtil().setWidth(20)),
                                  ),
                                  child: Container(
                                    color: Colors.black54,
                                    height: 70,
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, right: 10, bottom: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '开通黑胶VIP',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.brown,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                '加入黑胶VIP，立享超12项专属特权',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            height: 20,
                                            width: 60,
                                            alignment: AlignmentDirectional.topStart,
                                            child: FlatButton(
                                                padding: EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(20)),
                                                onPressed: () {},
                                                color: Colors.brown,
                                                textColor: Colors.grey,
                                                child: Text(
                                                  '会员中心',
                                                  style: TextStyle(fontSize: 10),
                                                ))),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.black45,
                                  height: 50,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '首月仅5元',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.brown,
                                              ),
                                            ),
                                            Text(
                                              '新用户专属优惠，快来加入吧！',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 24,
                                          width: 24,
                                          alignment: AlignmentDirectional.center,
                                          child: CircleAvatar(
                                            child:
                                            Image.asset('images/find_selected.png'),
                                          )),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        alignment: AlignmentDirectional.center,
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  color: Colors.black38,
                  child: LoginRadiusWidget(),
                ),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ImageTextVerticalWidget(
                          iconData: Icons.message,
                          text: '我的消息',
                          onTap: (){},
                        ),
                        ImageTextVerticalWidget(
                          iconData: Icons.phone,
                          text: '我的好友',
                          onTap: (){},
                        ),
                        ImageTextVerticalWidget(
                          iconData: Icons.phone,
                          text: '个人主页',
                          onTap: (){},
                        ),
                        ImageTextVerticalWidget(
                          iconData: Icons.phone,
                          text: '个性装扮',
                          onTap: (){},
                        ),
                      ],
                    )),
                Container(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        height: 0.5,
                      )),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.keyboard_voice,
                    label: '听歌识曲',
                    onTap: (){},
                  ),
          ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '演出',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '商城',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.location_on,
                    label: '附近的人',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '游戏推荐',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '口袋彩铃',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        height: 0.5,
                      )),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '我的订单',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '定时停止播放',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '扫一扫',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.notifications_active,
                    label: '音乐闹钟',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '在线听歌免流量',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '优惠劵',
                    onTap: (){},
                  ),
                ),
                Container(
                  child: ImageTextTextWidget(
                    icon: Icons.brightness_3,
                    label: '青少年模式',
                    message: '未开启',
                    onTap: (){},
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
                  child: Column(
                    children: <Widget>[
                      Divider(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: ImageTextTextWidget(
                              icon: Icons.brightness_2,
                              label: '夜间模式',
                              onTap: (){},
                            ),
                          ),
                          Container(
                            width: 100,
                            child: ImageTextTextWidget(
                              icon: Icons.settings,
                              label: '设置',
                              onTap: (){},
                            ),
                          ),
                          Container(
                            width: 80,
                            child: ImageTextTextWidget(
                              icon: Icons.power_settings_new,
                              label: '退出',
                              onTap: (){},
                            ),
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
