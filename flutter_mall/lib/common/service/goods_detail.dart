import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_mall/common/network/api.dart';
import 'package:flutter_mall/common/network/http_header.dart';
import 'package:flutter_mall/common/network/http_util.dart';
import 'package:flutter_mall/models/goods_detail.dart';


/**
 * 商品详情
 */
Future<GoodsDetail> getGoodsDetail(String id) async {
  var fromData = {'goodId': id};
  HttpUtil httpUtil = HttpUtil();
  httpUtil.setOptions(HttpUtil.getDefOptions());
  Response response = await httpUtil.post(API.GOODS_DETAIL, data: fromData);
  if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
      // Utf8Decoder utf8decoder = Utf8Decoder(); //fix中文乱码
      final result = json.decode(response.data);
      return GoodsDetail.fromJson(result);
  } else {
    // throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    return null;
  }
}