import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_mall/routers/router_handler.dart';

class Routers {
  static String root = '/'; // 配置根目录
  static String detailsPage = '/detail'; // 详情页面

  static void configurreRoutes(Router router) {
    // 找不到路由的情况
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('ERROR ====> ROUTES WAS NOT FOUND!!!!');
        }
    );
    // 整体配置
    router.define(detailsPage, handler: detailsHandler);
  }
}