import 'package:flutter/material.dart';
import 'package:flutter_mall/models/cart_info.dart';
import 'package:flutter_mall/provide/cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'cart_count.dart';

class CartItem extends StatelessWidget {

  final CartInfo item;
  CartItem(this.item);


  @override
  Widget build(BuildContext context) {
    print(item);
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBt(),
          _cartImage(),
          _cartGoodsName(),
          _cartPrice(context)
        ],
      ),
    );
  }
  //复选框
  Widget _cartCheckBt(){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.pink,//激活颜色设置为粉色
        onChanged:(bool val){

        }
      ),
    );
  }
  //商品图片
  Widget _cartImage(){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),//内边距
      decoration: BoxDecoration(
        border: Border.all(width:1.0,color: Colors.black12)
      ),
      child: Image.network(item.images),//item声明好了 所以不用传递
    );
  }

  //商品名称
  Widget _cartGoodsName() {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,//顶端左对齐
      child: Column(
        children: <Widget>[
          Text(item.goodsName),
          CartCount(item),
        ],
      ),
    );
  }

  //商品价格
  Widget _cartPrice(context) {
    return Container(
      width: ScreenUtil().setWidth(150),//只要合起来不超过750 就不会溢出
      alignment: Alignment.centerRight,//居中靠右
      child: Column(
        children: <Widget>[
          Text('￥${item.price}'),
          Container(//用来放icon删除按钮
            child: InkWell(
              onTap: (){
                // 删除单个商品
                Provide.value<CartProvide>(context).deleteOneGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,//浅灰色
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

}