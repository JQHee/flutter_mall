import 'package:flutter/material.dart';
import 'package:flutter_mall/common/service/category_service.dart';
import 'package:flutter_mall/models/category.dart';
import 'package:flutter_mall/models/category_goods_list.dart';
import 'package:flutter_mall/provide/category_child_provide.dart';
import 'package:flutter_mall/provide/category_goods_list_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

/**
 * 分类右侧导航菜单
 */

class CategoryRightNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryRightNavState();
  }

}

class _CategoryRightNavState extends State<CategoryRightNav> {

  //List list = ['名酒', '宝丰', '北京二锅头', '宝丰', '北京二锅头', '宝丰', '北京二锅头', '宝丰', '北京二锅头'];


  // 获取商品列表
   _getMoreList() async {
    Provide.value<CategoryChildProvide>(context).addPage();
    String  categoryId = Provide.value<CategoryChildProvide>(context).categoryId;
    String categorySubId = Provide.value<CategoryChildProvide>(context).subId;
    int page = Provide.value<CategoryChildProvide>(context).page;
    CategoryGoodsList goodsList = await getGoodsList(page, categoryId, categorySubId);
    // 更改右侧商品列表的值
    if (goodsList.data == null) {
      Provide.value<CategoryChildProvide>(context).changNoMore('没有更多了');
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
    } else {
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data ?? []);
    }
  }

  Widget _rightInkWell(int index, CategoryBxMallSubDto item) {

    bool isClick = false;
    isClick = (index == Provide.value<CategoryChildProvide>(context).childIndex) ? true : false;

    return InkWell(
      onTap: () {
        Provide.value<CategoryChildProvide>(context).changeChildIndex(index, item.mallSubId);
        _getMoreList();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: isClick ? Colors.pink : Colors.black),
        
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provide<CategoryChildProvide>(
      builder: (context, child, categoryChild) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570), // 750 - 180
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12)
            )
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryChild.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(index, categoryChild.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

}