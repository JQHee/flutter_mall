import 'package:flutter/material.dart';

/**
 * 从商品详情页跳转到购物车页面
 */

class CurrentIndexProvide with ChangeNotifier{
  int currentIndex=0;

  changeIndex(int newIndex){
    currentIndex=newIndex;
    notifyListeners();//通知
  }
}