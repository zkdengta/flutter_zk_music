import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzkmusic/utils/utils.dart';
import 'package:flutterzkmusic/model/Banner.dart';

class BannerWidget extends StatefulWidget{

  final List<Banners> banner;
  final double height;
  final ValueChanged<int> onTap;
  final Curve curve; //动画曲线

  BannerWidget(
    this.banner,{
      this.height = 200,
      this.onTap,
      this.curve = Curves.linear,
  }):assert(banner != null);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget>{

  PageController _pageController;
  int _curIndex;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _curIndex = widget.banner.length * 5;
    _pageController = PageController(initialPage: _curIndex);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    var length = widget.banner.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget.banner.map((s){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setWidth(12),
                color: s == widget.banner[_curIndex % length]
                ? Colors.red : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPageView() {
    var length = widget.banner.length;
    return AspectRatio(  //作用是调整child到设置的宽高比
      aspectRatio: (1080 + (ScreenUtil().setWidth(15)*2))/
          (400 - (ScreenUtil().setWidth(15))),
      child: PageView.builder( ///PageView - 创建一个可滚动列表。PageView.builder - 创建一个滚动列表，指定数量。PageView.custom - 创建一个可滚动的列表，自定义子项。
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _curIndex = index;
              if (index == 0) {
                _curIndex = length;
                _changePage();
              }
            });
          },
          itemBuilder: (context, index){
            return GestureDetector(
              onPanDown: (details){
                _cancelTimer();
              },
              onTap: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('当前 page 为 ${index % length}'),
                    duration: Duration(milliseconds: 500),
                  )
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
                  child: Utils.showNetImage(
                      '${widget.banner[index % length].pic}?param=540y210',
                        fit: BoxFit.fitWidth
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  /// 点击到图片的时候取消定时任务
  void _cancelTimer() {
    if(_timer != null){
      _timer.cancel();
      _timer = null;
      _initTimer();
    }
  }

  /// 初始化定时任务
  _initTimer() {
    if(_timer == null){
      if(mounted){
        _timer = Timer.periodic(Duration(seconds: 3), (t){
          _curIndex++;
          _pageController.animateToPage(
              _curIndex,
              duration: Duration(milliseconds: 300),
              curve: Curves.linear,
          );
        });
      }
    }
  }


  /// 切换页面，并刷新小圆点
  _changePage() {
    Timer(Duration(milliseconds: 350), () {
      _pageController.jumpToPage(_curIndex);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

}