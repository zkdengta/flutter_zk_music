import 'package:dio/dio.dart';
import 'package:flutterzkmusic/utils/log_util.dart';

class CustomLogInterceptor extends LogInterceptor {
  CustomLogInterceptor({
    request = true,
    requestHeader = true,
    requestBody = true,
    responseHeader = true,
    responseBody = false,
    error = true,
  }):super(
      request: request,
      requestHeader: requestHeader,
      requestBody: requestBody,
      responseHeader: responseHeader,
      responseBody: responseBody,
      error: error);

  @override
  void printKV(String key, Object v) {
    // TODO: implement printKV
    LogUtil.e('$key: $v');
  }

  @override
  printAll(msg) {
    LogUtil.e('$msg');
  }
}