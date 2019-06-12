import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_mall/pages/details_page.dart';

// Handler相当于处理器
Handler detailsHandler = Handler(
  // 参数为固定写法，传这两个参数
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    // 定义一个变量，接收传递的id参数
    String goodsId = params['id'].first;
    print('index > details goodsId is ${goodsId}');
    return DetailsPage(goodId: goodsId);
  }
);