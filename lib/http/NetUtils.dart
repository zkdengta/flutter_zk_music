import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'CostomLogInterceptor.dart';

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
}