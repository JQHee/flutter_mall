import 'package:flutter/material.dart';

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
          body: Center(
            child: Text('商品类别'),
          ),
    );
  }

}