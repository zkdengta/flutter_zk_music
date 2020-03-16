import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutterzkmusic/application.dart';
import 'package:flutterzkmusic/route/navigate_service.dart';
import 'package:flutterzkmusic/route/routes.dart';
import 'package:flutterzkmusic/widgets/loading.dart';
import 'package:path_provider/path_provider.dart';
import 'costom_log_interceptor.dart';
import 'package:flutterzkmusic/utils/utils.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = "http://192.168.3.16";

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(
      baseUrl: '$baseUrl:3000',
      followRedirects: false
    ))
    ..interceptors.add(CookieManager(cj))
    ..interceptors.add(new CustomLogInterceptor(responseBody: true,requestBody: true));
  }

  static Future<Response> _get(
      BuildContext context,
      String url,{
       Map<String,dynamic> params,
       bool isShowLoading = true,
  })async {
    if(isShowLoading)
      Loading.showLoading(context);
    try{
      return await _dio.get(url,queryParameters: params);
    }on DioError catch (e){
      if(e == null){
        return Future.error(Response(data: -1));
      }else if(e.response != null){
        if(e.response.statusCode >=300 && e.response.statusCode < 400){
          _reLogin();
          return Future.error(Response(data: -1));
        }else{
          return Future.value(e.response);
        }
      }else{
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200),(){
      Application.getIt<NavigateService>().popAndPushNamed(Routes.login);
      Utils.showToast('登录失效，请重新登录');
    });
  }
}