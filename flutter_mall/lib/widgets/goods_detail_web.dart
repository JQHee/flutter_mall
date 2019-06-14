import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mall/provide/goods_info_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

/**
 * 商品详情的富文本内容
 */

class GoodsDetailWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var goodsDetails = Provide.value<GoodsInfoProvide>(context).goodsDetail.data.goodInfo.goodsDetail;

    // TODO: implement build
    return Provide<GoodsInfoProvide> (
      builder: (context, child, val) {
        var isLeft = Provide.value<GoodsInfoProvide>(context).isLeft;
        if (isLeft) {
          return Container(
            child: Html(
              data: goodsDetails,
            ),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('暂时没有数据'),
          );
        }
      },
    );
  }

}