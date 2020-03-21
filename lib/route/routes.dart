import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterzkmusic/route/route_handles.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "login";

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>>params){
        return null;
    });
    router.define(home, handler: homeHandler);
  }
}