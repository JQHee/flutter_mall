import 'package:flutter/material.dart';
import 'package:flutter_mall/widgets/category_left_nav.dart';
import 'package:flutter_mall/widgets/category_right_nav.dart';
import 'package:flutter_mall/widgets/category_goods_list.dart';

import 'package:provide/provide.dart';
import 'package:flutter_mall/provide/category_child_provide.dart';

/**
 * 分类
 */

class CategoryPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }

}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Row(
          children: <Widget>[
            CategoryLeftNav(),
            Column(
              children: <Widget>[
                CategoryRightNav(),
                CategroyGoodsList()
              ],
            )
          ],
        ),
      ),
    );
  }

}