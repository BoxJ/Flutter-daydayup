import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class BoxDioTool {

  static Dio boxDio;

  static const String API_HostUrl = 'https://www.apiopen.top/'; //主host
  static const int CONNECT_Timeout = 5000;  //链接超时时间设置
  static const int RECEIVE_Timeout = 5000;  //接收超时时间设置

  /// 定义各种请求方法
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// 封装一个request方法供外部使用
  //url 请求链接
  //parameters 请求参数
  //metthod 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static request<T>(String url,
      {parameters,
        method = 'GET',
        Function(T t) onSuccess,
        Function(String error) onError}) async {

    parameters = parameters ?? {};
    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    debugPrint('请求方法：' + method);
    debugPrint('请求地址：' + url);
    debugPrint('请求参数：' + parameters.toString());

    Dio dio = shareInstance();
    var result;
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(result);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
      debugPrint('返回数据：' + response.toString());
    } on DioError catch (e) {
      debugPrint('出错了：' + e.toString());
      onError(e.toString());
    }
  }

  /// 创建 dio 实例对象
  static Dio shareInstance() {
    if (boxDio == null) {
      var options = BaseOptions(
        headers: {'BoxSign':"ali666"}, //自定义请求头
        connectTimeout: CONNECT_Timeout,
        receiveTimeout: RECEIVE_Timeout,
        responseType: ResponseType.plain,
        validateStatus: (status) {
          return true;
        },
        baseUrl: API_HostUrl,
      );
      boxDio = new Dio(options);
    }
    return boxDio;
  }
}