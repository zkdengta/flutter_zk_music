import 'package:flutter/material.dart';
import 'package:flutterzkmusic/application.dart';
import 'package:flutterzkmusic/http/net_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzkmusic/utils/navigator_util.dart';

class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState  extends State<SplashPage> with TickerProviderStateMixin{

  AnimationController _animationController;
  Tween _tween;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _tween = Tween(begin: 0, end: 1);
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..drive(_tween);
    Future.delayed(Duration(milliseconds: 500), () {
      _animationController.forward();
    });
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuart);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500), () {
          goPage();
        });
      }
    });
  }
  void goPage() async{
    await Application.initSp();
    NavigatorUtil.goHomePage(context);
  }


  @override
  Widget build(BuildContext context) {
    NetUtils.init();
    ScreenUtil.init(context, width: 750, height: 1334);
    final size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ScaleTransition(
          scale: _curvedAnimation,
          child: Hero(
            tag: 'logo',
            child: Image.asset('images/welcome.png'),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}