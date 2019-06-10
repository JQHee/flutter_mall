import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/index_page.dart';

// 源码：https://github.com/shenghy/flutter_shop
// 序列教程： https://www.cnblogs.com/wangjunwei/tag/flutter/
// 2019-06-10 -> 20

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '百姓生活+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: IndexPage()
    );
  }
}
