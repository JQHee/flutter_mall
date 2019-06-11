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
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().scaleWidth(370),
      child: Text(
        list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.clip,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Text('商品列表'),
    );
  }

}