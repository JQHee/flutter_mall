import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mall/common/service/category_service.dart';
import 'package:flutter_mall/models/category_goods_list.dart';
import 'package:flutter_mall/provide/category_goods_list_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

/**
 * 类别的商品列表
 * 可上拉加载
 */

class CategroyGoodsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategroyGoodsListState();
  }

}

class _CategroyGoodsListState extends State<CategroyGoodsList> {

  var page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _goodsImage(List newList, index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List newList, index) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格￥${newList[index].presentPrice}',
            style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30))
          ),
          Text(
            '价格￥${newList[index].oriPrice}',
            style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough), // 删除线
          )
        ],
      ),
    );
  }

  Widget _listWidget(List newList, index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index),
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, goodsList) {
        return Expanded( // Expaned是有伸缩能力的小部件
          child: Container(
              width: ScreenUtil().setWidth(570),
              child: ListView.builder(
                itemCount: goodsList.goodsList.length,
                itemBuilder: (context, index) {
                  return _listWidget(goodsList.goodsList, index);
                },
              ),
            )
        );
      },
    ) ;
  }

}