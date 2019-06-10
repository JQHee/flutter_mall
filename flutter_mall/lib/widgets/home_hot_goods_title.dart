import 'package:flutter/material.dart';

/**
 * 首页底部热门商品标题
 */

class HomeHotGoodsTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
        
        padding:EdgeInsets.all(5.0),
        alignment:Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border:Border(
            bottom: BorderSide(width:0.5 ,color:Colors.black12)
          )
        ),
        child: Text('火爆专区'),
    );
  }

}