import 'package:flutter/material.dart';
import 'package:flutter_mall/common/service/goods_detail.dart' as GoodsDetailService;
import 'package:flutter_mall/models/goods_detail.dart';
import 'package:flutter_mall/common/service/goods_detail.dart';

class GoodsInfoProvide with ChangeNotifier {

  // 商品详情的变量
  GoodsDetail goodsDetail = null;

  bool isLeft = true;
  bool isRight = false;

  // tabbar切换的方法
  changeLeftOrRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  /**
   * 商品详情数据，实现UI和业务逻辑分离
   */
  getGoodsDetail(String id) async {
     goodsDetail = await GoodsDetailService.getGoodsDetail(id);
     notifyListeners();
  }

}