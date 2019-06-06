import 'package:flutter/material.dart';
import 'package:flutter_mall/widgets/home_swiper.dart';
import 'package:flutter_mall/widgets/home_top_navigator.dart';
import 'package:flutter_mall/common/service/service_method.dart';
import 'dart:convert';

/**
 * 首页
 */

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

String homePageContent='正在获取数据';

@override
  void initState() {
    getHomePageContent().then((value){
      setState(() {
        homePageContent = value.toString();
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar: AppBar(title: Text('商城首页')),
          body: FutureBuilder(
            future: getHomePageContent(),
            builder: (ctx, snapshop) {
              if (snapshop.hasData) {
                var data = json.decode(snapshop.data.toString());
                List<Map>  swiper = (data['data']['slides'] as List).cast();
                List<Map>  navigatorList = (data['data']['category'] as List).cast();
                return Column(
                  children: <Widget>[
                    HomeSwiper(swiperDataList: swiper),
                    HomeTopNavigator(navigatorList: navigatorList),
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中...'),
                );
              }
            }
          ),
        );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}