import 'package:flutter/material.dart';
import 'package:flutter_mall/models/category.dart';

class CategoryChildProvide with ChangeNotifier {

  List<CategoryBxMallSubDto> childCategoryList = [];
  // 子类高亮索引（商品头部的控件）
  int childIndex = 0;
  // 大类的Id
  String categoryId = '4';
  // 小类id
  String subId = '';
  // 商品列表上拉刷新
  int page = 1;
  String noMoreText = '';

  getChildCategory(List<CategoryBxMallSubDto> list, String id) {
    page = 1;
    noMoreText = '';
    // 每次请求大类都要清空小类
    childIndex = 0;
    categoryId = id;
    CategoryBxMallSubDto all=CategoryBxMallSubDto();
    all.mallSubId="";
    all.mallCategoryId="00";
    all.comments="null";
    all.mallSubName='全部';
    childCategoryList=[all];
    //childCategoryList=list;
    childCategoryList.addAll(list);
    notifyListeners(); // 监听
  }

  // 改变子类索引
  changeChildIndex(index, String id) {
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners(); // 监听
  }

  // 增加Page方法 
  addPage() {
    page++;
  }

  // 改变noMore的方法
  changNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }

}