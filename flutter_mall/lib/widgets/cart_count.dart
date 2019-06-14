import 'package:flutter/material.dart';
import 'package:flutter_mall/provide/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {

  var item;
  CartCount(this.item);//接收一个item参数

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top:5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12)//设置所有的边框宽度为1 颜色为浅灰
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(),
          _addBtn(context)
        ],
      ),
    );
  }
  //减少按钮
  Widget _reduceBtn(context){
    return InkWell(
      onTap: (){

        Provide.value<CartProvide>(context).addOrReduceAction(item, 'reduce');
      },
      child: Container(
          width: ScreenUtil().setWidth(45),//是正方形的所以宽和高都是45
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,//上下左右都居中
          decoration: BoxDecoration(
            color: item.count>1 ? Colors.white:Colors.black12,//按钮颜色大于1是白色，小于1是灰色,
            border: Border(//外层已经有边框了所以这里只设置右边的边框
              right:BorderSide(width: 1.0,color: Colors.black12)
            )
          ),
          child: item.count>1 ? Text('-') : Text(' '),//数量小于1 什么都不显示,
      ),
    );
  }
  //加号
  Widget _addBtn(context){
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).addOrReduceAction(item, 'add');
      },
      child: Container(
          width: ScreenUtil().setWidth(45),//是正方形的所以宽和高都是45
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,//上下左右都居中
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(//外层已经有边框了所以这里只设置右边的边框
              left:BorderSide(width: 1.0,color: Colors.black12)
            )
          ),
          child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget _countArea(){
    return Container(
       width: ScreenUtil().setWidth(70),//爬两个数字的这里显示不下就宽一点70
       height: ScreenUtil().setHeight(45),//高度和加减号保持一样的高度
       alignment: Alignment.center,//上下左右居中
       color: Colors.white,//北京颜色 设置为白色
       child: Text('1'),//先默认设置为1 因为后续是动态的获取数字
    );
  }

}