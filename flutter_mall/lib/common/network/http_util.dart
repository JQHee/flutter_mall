
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_mall/common/network/http_header.dart';


/**
 * 网络请求工具
 */
class HttpUtil {

  static final HttpUtil _instance = HttpUtil._init();
  static Dio _dio;
  static BaseOptions _options = getDefOptions();

    factory HttpUtil() {
    return _instance;
  }

  HttpUtil._init() {
    _dio = new Dio();
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.connectTimeout = 10 * 1000;
    options.receiveTimeout = 20 * 1000;
    options.contentType = ContentType.parse('application/x-www-form-urlencoded');

  /*
    Map<String, dynamic> headers = Map<String, dynamic>();
    headers['Accept'] = 'application/json';

    String platform;
    if(Platform.isAndroid) {
      platform = "Android";
    } else if(Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = HttpHeader.getHttpHeader();
    */

    return options;
  }

  setOptions(BaseOptions options) {
    _options = options;
    _dio.options = _options;
  }

  /**
   * GET 请求
   */
   get(url, {data, cancelToken}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await _dio.get(
        url,
        queryParameters: data,
        cancelToken: cancelToken,
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response;
  }

  /**
   * POST 请求
   */
  post(url, {data, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await _dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response;
  }

}