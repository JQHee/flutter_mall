import 'package:flutter/material.dart';
import 'package:flutter_mall/provide/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child: Provide<CartProvide>(
        builder: (context, child, val) {
          return Row(
            children: <Widget>[
              _selectAllBtn(context),
              _allPriceArea(context),
              _goButton(context)
            ],
          );
        },
      ),
    );
  }
  //全选
  Widget _selectAllBtn(context){
    bool isAllCheck=Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Colors.pink,//激活的颜色
            onChanged: (bool val){
              Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
            },//事件
          ),
          Text('全选')
        ],
      ),
    );
  }

  //合计
  Widget _allPriceArea(context){
    double allPrice = Provide.value<CartProvide>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(430),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计：',
                  style:TextStyle(
                    fontSize:ScreenUtil().setSp(36)
                  )
                ),
              ),
              //红色的价格
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '${allPrice}',
                  style: TextStyle(
                     fontSize: ScreenUtil().setSp(36),
                     color: Colors.red
                  )
                ),
              )
            ],
          ),
          //第二行
          Container(
            width: ScreenUtil().setWidth(430),//和第一行一样宽
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费,预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22)
              ),
            ),
          )
        ],
      ),
    );
  }

  //结算 用 inkWell
  Widget _goButton(context){
    int allGoodsCount= Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left:10.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,//居中对齐
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0)//圆角
          ),
          child: Text(
            '结算(${allGoodsCount})',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}