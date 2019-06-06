import 'package:dio/dio.dart';

/**
 * 网络请求工具
 */
class HttpUtil {

  static HttpUtil _instance;
  Dio _dio;
  BaseOptions _options;

  /**
   * 创建单例
   */
  static HttpUtil getInstance() {
    print('getInstance');
    if (_instance == null) {
      _instance = new HttpUtil();
    }
    return _instance;
  }

  HttpUtil() {
    // 或者通过传递一个 `options`来创建dio实例
    _options = BaseOptions(
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: {},
    );
    _dio = new Dio(_options);

    // 添加拦截器
    // dio.interceptors.add(element)

  }

  /**
   * GET 请求
   */
   get(url, parameters, headers, cancelToken) async {
    print('get请求启动! url：$url ,body: $parameters');
    Response response;
    try {
      _dio.options.headers = headers;
      response = await _dio.get(
        url,
        queryParameters: parameters,
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
  post(url, data, headers, cancelToken) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      _dio.options.headers = headers;
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