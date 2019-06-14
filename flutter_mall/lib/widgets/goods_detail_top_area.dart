import 'package:flutter/material.dart';
import 'package:flutter_mall/provide/goods_info_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


/**
 * 详情页头部区域
 */

class GoodsDetailTopArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GoodsDetailTopAreaState();
  }

}

class _GoodsDetailTopAreaState extends State<GoodsDetailTopArea> {


  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  // 商品名称
  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      child: Text(
        name,
        style:TextStyle(
          fontSize: ScreenUtil().setSp(30)
        )
      ),
    );
  }

  // 商品编号
  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 5.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        num,
        style: TextStyle(
          color: Colors.black12
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(presentPrice, oriPrice) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${presentPrice}',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40)
            ),
          ),
          Text(
            '市场价：￥${oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provide<GoodsInfoProvide>(
      builder: (context, child, val) {
        var goodsInfo = null;
        try {
          goodsInfo = Provide.value<GoodsInfoProvide>(context).goodsDetail.data.goodInfo;
        } catch(e) {
          print('error ${e}');
        }
        if (goodsInfo != null) {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _goodsImage(goodsInfo.image1),
                _goodsName(goodsInfo.goodsName),
                _goodsNum(goodsInfo.goodsSerialNumber),
                _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
              ],
            ),
          );
        } else {
          return Text('正在加载中...');
        }
      },
    );
  }

}