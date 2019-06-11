import 'package:flutter/material.dart';
import 'package:flutter_mall/common/service/service_method.dart';
import 'package:flutter_mall/models/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  void initState() {
    // TODO: implement initState
     _getCategory();
    super.initState();
  }

  // 获取分类数据 
  _getCategory() async {
    Category category = await getCategory();
    setState(() {
      list = category.data;
    });
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
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left:10.0,top:10.0),
        decoration: BoxDecoration(
          color: Colors.white,
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