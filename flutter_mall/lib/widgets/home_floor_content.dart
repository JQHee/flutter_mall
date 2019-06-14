import 'package:flutter/material.dart';
import 'package:flutter_mall/routers/application.dart';
import 'package:flutter_mall/routers/router_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/**
 * 首页楼层内容
 */

class HomeFloorContent extends StatefulWidget {

  final List floorGoodsList;

  const HomeFloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeFloorContentState();
  }
  
}

class _HomeFloorContentState extends State<HomeFloorContent> {


  // 每个子项拆分成item
  Widget _goodsItem(context, Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          RouterUtil.routeToDetailPage(context, goods['goodsId']);
          // Application.router.navigateTo(context, '/detail?id=${goods['goodsId']}');
        },
        child: Image.network(goods['image']),
      ),
    );
  }

  // 第一行 
  Widget _firstRow(context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, widget.floorGoodsList.first),
        Column(
          children: <Widget>[
            _goodsItem(context, widget.floorGoodsList[1]),
            _goodsItem(context, widget.floorGoodsList[2])
          ],
        )
      ],
    );
  }

  // 第二行 
  Widget _otherGoods(context) {
    return Row(
      children: <Widget>[
        _goodsItem(context, widget.floorGoodsList[3]),
        _goodsItem(context, widget.floorGoodsList[4])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(context),
          _otherGoods(context)
        ],
      ),
    );
  }

}