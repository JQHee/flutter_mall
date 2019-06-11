import 'package:flutter/material.dart';
import 'package:flutter_mall/models/category.dart';

class CategoryChildProvide with ChangeNotifier {

  List<CategoryBxMallSubDto> childCategoryList = [];

  getChildCategory(List<CategoryBxMallSubDto> list) {

    CategoryBxMallSubDto all=CategoryBxMallSubDto();
    all.mallCategoryId="00";
    all.mallCategoryId="00";
    all.comments="null";
    all.mallSubName='全部';
    childCategoryList=[all];
    //childCategoryList=list;
    childCategoryList.addAll(list);
    notifyListeners(); // 监听
  }

}