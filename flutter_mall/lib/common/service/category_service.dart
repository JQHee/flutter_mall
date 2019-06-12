import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_mall/common/network/api.dart';
import 'package:flutter_mall/common/network/http_header.dart';
import 'package:flutter_mall/common/network/http_util.dart';
import 'package:flutter_mall/models/category.dart';
import 'package:flutter_mall/models/category_goods_list.dart';

// 获取分类左边列表
Future<Category> getCategory() async {
  var fromData = {};
  HttpUtil httpUtil = HttpUtil();
  httpUtil.setOptions(HttpUtil.getDefOptions());
  Response response = await httpUtil.post(API.CATEGORY, data: fromData);
  if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
      // Utf8Decoder utf8decoder = Utf8Decoder(); //fix中文乱码
      final result = json.decode(response.data);
      return Category.fromJson(result);
  } else {
    // throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    return null;
  }
}

// 获取列表商品列表
Future<CategoryGoodsList> getGoodsList(int page, String categoryId, String CategorySubId) async {
  var fromData = {
    'page':page.toString(),
    'categoryId': categoryId == null ? 4 : categoryId,
    'CategorySubId': CategorySubId
  };
  HttpUtil httpUtil = HttpUtil();
  httpUtil.setOptions(HttpUtil.getDefOptions());
  Response response = await httpUtil.post(API.CATEGORY_GOODS, data: fromData);
  if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
    final result = json.decode(response.data);
    CategoryGoodsList goodsList = CategoryGoodsList.fromJson(result);
    return goodsList;
  } else {
    // throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    return null;
  }

}