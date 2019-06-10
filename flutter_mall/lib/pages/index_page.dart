
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mall/pages/home_page.dart';
import 'package:flutter_mall/pages/cart_page.dart';
import 'package:flutter_mall/pages/category_page.dart';
import 'package:flutter_mall/pages/member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * tabbar 底部导航
 */
class IndexPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }

}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
     BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
     BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
     BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    ),
  ];

  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int currentIndex = 0; // 当前索引
  var currentPage;

  @override
  void initState() {
    // 默认
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

        // 适配
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 255, 255, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }

}