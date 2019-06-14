import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_mall/common/network/api.dart';
import 'package:flutter_mall/common/network/http_header.dart';
import 'package:flutter_mall/common/network/http_util.dart';

/**
 * 获得商城首页信息的方法
 */
Future getHomePageContent() async {
  var fromData = {'lon':'115.02932','lat':'35.76189'};
  HttpUtil httpUtil = HttpUtil();
  httpUtil.setOptions(HttpUtil.getDefOptions());
  Response response = await httpUtil.post(API.HOME, data: fromData);
  if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
    return response.data;
  } else {
    // throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    return null;
  }

}

/**
 * 获取首页热门商品
 */
Future getHomeHotGoods(int page) async {
  var fromData = {'page':page.toString()};
  HttpUtil httpUtil = HttpUtil();
  httpUtil.setOptions(HttpUtil.getDefOptions());
  Response response = await httpUtil.post(API.HOME_HOT_GOODS, data: fromData);
  if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
    return response.data;
  } else {
    // throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    return null;
  }

}