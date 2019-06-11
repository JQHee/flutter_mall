import 'package:flutter/material.dart';
import 'package:flutter_mall/models/category.dart';
import 'package:flutter_mall/provide/category_child_provide.dart';
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

  Widget _rightInkWell(CategoryBxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(18))
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
              return _rightInkWell(categoryChild.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

}