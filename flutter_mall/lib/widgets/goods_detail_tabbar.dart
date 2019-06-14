import 'package:flutter/material.dart';
import 'package:flutter_mall/provide/goods_info_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

/**
 * 商品详情 详情和评论页面切换
 */

class GoodsDetailTabbar extends StatelessWidget {


  Widget _myTabbarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provide.value<GoodsInfoProvide>(context).changeLeftOrRight('left');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isLeft ? Colors.pink : Colors.black12
            ),
          )
        ),
        child: Text(
          '详情',
          style: TextStyle(
            color: isLeft ? Colors.pink : Colors.black12
          )
        ),
      ),
    );
  }

    Widget _myTabbarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provide.value<GoodsInfoProvide>(context).changeLeftOrRight('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isRight ? Colors.pink : Colors.black12
            ),
          )
        ),
        child: Text(
          '评论',
          style: TextStyle(
            color: isRight ? Colors.pink : Colors.black12
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
   return Provide<GoodsInfoProvide>(
      builder: (context,child,val){
        var isLeft=Provide.value<GoodsInfoProvide>(context).isLeft;
        var isRight=Provide.value<GoodsInfoProvide>(context).isRight;

        return Container(
          margin: EdgeInsets.only(top:15.0),
          child: Row(
            children: <Widget>[
              _myTabbarLeft(context,isLeft),
              _myTabbarRight(context,isRight)
            ],
          ),
        );
      },
    );
  }

}