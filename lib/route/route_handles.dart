import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterzkmusic/pages/splash_page.dart';
import 'package:flutterzkmusic/pages/home_page.dart';

// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return SplashPage();
    });

//// 登录页
//var loginHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
//      return LoginPage();
//    });

// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return HomePage();
    });