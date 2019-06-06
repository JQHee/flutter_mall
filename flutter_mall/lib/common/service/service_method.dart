import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_mall/common/network/api.dart';
import 'package:flutter_mall/common/network/http_header.dart';
import 'package:flutter_mall/common/network/http_util.dart';

//获得商城首页信息的方法
Future getHomePageContent() async {

  var fromData = {'lon':'115.02932','lat':'35.76189'};
  var headers = HttpHeader.getHttpHeader();
  Response response = await HttpUtil.getInstance().post(API.HOME, fromData, headers, null);
  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
  }

}