import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutterzkmusic/model/Banner.dart' as prefix0;
import 'package:flutterzkmusic/widgets/h_empty_view.dart';
import 'package:flutterzkmusic/widgets/widget_banner.dart';
import 'package:flutterzkmusic/widgets/widget_future_builder.dart';
import 'package:flutterzkmusic/http/net_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzkmusic/widgets/v_empty_view.dart';
import 'package:flutterzkmusic/widgets/wiget_column.dart';
import 'package:flutterzkmusic/model/recommend.dart';
import 'package:flutterzkmusic/widgets/widget_play_list.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin,  AutomaticKeepAliveClientMixin{

  ///轮播图
  Widget _buildBanner(){
    return CustomFutureBuilder<prefix0.Banner>(
      futureFunc: NetUtils.getBannerData,
      builder: (context,data){
        return BannerWidget(data.banners);
      },
    );
  }

  ///分类列表
  Widget _buildHomeCategoryList(){
    var map = {
      '每日推荐': 'images/icon_daily.png',
      '歌单': 'images/icon_playlist.png',
      '排行榜': 'images/icon_rank.png',
      '电台': 'images/icon_radio.png',
      '直播': 'images/icon_look.png',
    };

    var keys = map.keys.toList();
    var width = ScreenUtil().setWidth(90);

    return GridView.custom(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: keys.length,
          childAspectRatio: 1/1.1,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
            (context,index){
              return GestureDetector(
                behavior: HitTestBehavior.translucent,

                onTap: (){},
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: width,
                          height: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width/2),
                            border: Border.all(color: Colors.black12,width: 0.5),
                            gradient: RadialGradient(
                              colors: [
                                Color(0xFFFF8174),
                                Colors.red,
                              ],
                              center: Alignment(-1.7,0),
                              radius: 1,
                            ),
                            color: Colors.red
                          ),
                        ),
                        Image.asset(
                          map[keys[index]],
                          width: width,
                          height: width,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: keys[index] == '每日推荐'
                          ? Text(
                            '${DateUtil.formatDate(DateTime.now(),format: 'dd')}',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                            ),
                          ):Text('')
                        ),
                      ],
                    ),
                    VEmptyView(10),
                    Text(
                      '${keys[index]}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: keys.length,
        ),
    );
  }

  ///推荐歌单
  Widget _buildRecommendPlayList(){
    return CustomFutureBuilder<RecommendData>(
      futureFunc: NetUtils.getRecommendData,
      builder: (context,snapshot){
        var data = snapshot.result;
        return Container(
          height: ScreenUtil().setWidth(300),
          child: ListView.separated(
              itemBuilder: (context,index){
                return PlayListWidget(
                  text: data[index].name,
                  playCount: data[index].playCount,
                  picUrl: data[index].picUrl,
                  maxLines: 2,
                  onTap: (){},
                );
              },
              separatorBuilder: (context,index){
                return HEmptyView(ScreenUtil().setWidth(20));
              },
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15),
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            VEmptyView(30),
            _buildHomeCategoryList(),
            ColumnWidget(
              title: '推荐歌单',
              leftText: '为你精挑细选',
              rightText: '查看更多',
              onTap: (){},
            ),
            VEmptyView(20),
           _buildRecommendPlayList(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
