import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 适配
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

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
