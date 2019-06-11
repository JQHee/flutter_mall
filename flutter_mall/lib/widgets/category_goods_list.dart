import 'package:flutter/material.dart';
import 'package:flutter_mall/common/service/category_service.dart';
import 'package:flutter_mall/models/category_goods_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  List list = [];

  _getGoodsList() async {
    CategoryGoodsList goodsList = await getGoodsList(page, 4, "");
    setState(() {
      list = goodsList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getGoodsList();
    super.initState();
  }

  Widget _goodsImage(index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(index) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格￥${list[index].presentPrice}',
            style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30))
          ),
          Text(
            '价格￥${list[index].oriPrice}',
            style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough), // 删除线
          )
        ],
      ),
    );
  }

  Widget _listWidget(index) {
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
            _goodsImage(index),
            Column(
              children: <Widget>[
                _goodsName(index),
                _goodsPrice(index),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

  /*
    double top = MediaQuery.of(context).padding.top;
    if (top == 0) {
      top = 20;
    }
    var height = 1334 - 44 * 2 - 80 * 2 - top * 2 - 50 * 2; 
    */

    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(976),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listWidget(index);
        },
      ),
    );
  }

}