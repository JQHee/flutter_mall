import 'package:flutter/material.dart';
import 'package:flutter_mall/provide/goods_info_provide.dart';
import 'package:flutter_mall/widgets/goods_detail_top_area.dart';
import 'package:provide/provide.dart';

/**
 * 商品详情页
 */

class DetailsPage extends StatelessWidget {

  final String goodId;

  const DetailsPage({Key key, this.goodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('商品详情'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context, snapshot) {
          // 判断是否有数据
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: <Widget>[
                  GoodsDetailTopArea(),
                ],
              ),
            );
          } else {
            return Text('加载中');
          }
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<GoodsInfoProvide>(context).getGoodsDetail(goodId);
    return '完成加载';
  }

}