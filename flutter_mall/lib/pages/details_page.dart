import 'package:flutter/material.dart';

/**
 * 商品详情页
 */

class DetailsPage extends StatelessWidget {

  final String goodId;

  const DetailsPage({Key key, this.goodId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('商品ID = ${goodId}'),
      ),
    );
  }

}