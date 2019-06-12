import 'package:flutter/material.dart';
import 'package:flutter_mall/models/category_goods_list.dart';

class CategoryGoodsListProvide with ChangeNotifier {

  List<CategoryGoodsListData> goodsList = [];

  getGoodsList(List<CategoryGoodsListData> list) {
    goodsList = list;
    notifyListeners(); // 监听
  }

}