import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}