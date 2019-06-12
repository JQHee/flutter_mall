import 'package:flutter/material.dart';
import 'package:flutter_mall/common/service/category_service.dart';
import 'package:flutter_mall/models/category.dart';
import 'package:flutter_mall/models/category_goods_list.dart';
import 'package:flutter_mall/provide/category_goods_list_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_mall/provide/category_child_provide.dart';
import 'package:provide/provide.dart';

/**
 * 分类左侧导航菜单
 */

class CategoryLeftNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryLeftNavState();
  }

}

class _CategoryLeftNavState extends State<CategoryLeftNav> {

  List list=[];
  var listIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
     _getCategory();
     _getGoodsList();
    super.initState();
  }

  // 获取分类数据 
  _getCategory() async {
    Category category = await getCategory();
    setState(() {
      list = category.data;
    });
    if (!list.isEmpty) {
      var categoryId = list[0].mallCategoryId;
      // 第一次加载设置默认显示
      Provide.value<CategoryChildProvide>(context).getChildCategory(list[0].bxMallSubDto, categoryId);
    }

  }

  // 获取商品列表
   _getGoodsList({String categoryId}) async {
    CategoryGoodsList goodsList = await getGoodsList(1, categoryId, "");
    // 更改右侧商品列表的值
    Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width:1.0,color: Colors.black12),//有边框
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (contex,index){
          return _leftInkWell(index);
        },
      ),
    );
  }

  Widget _leftInkWell(int index){
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: (){
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;
        Provide.value<CategoryChildProvide>(context).getChildCategory(childList, categoryId);
        // 获取商品数据
        _getGoodsList(categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10.0,top:10.0),
        decoration: BoxDecoration(
          color: isClick ? Colors.black26 : Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),//设置字体大小，为了兼容使用setSp
        ),
      ),
    );
  }

}