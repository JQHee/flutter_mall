import 'package:flutter/material.dart';
import 'package:flutter_mall/widgets/home_swiper.dart';
import 'package:flutter_mall/widgets/home_top_navigator.dart';
import 'package:flutter_mall/widgets/grid_page.dart';
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

    ///构建数据
  List<Widget> _buildChildren(List<Map> items){
    List<Widget> list = List();
    for (int i=0; i < items.length; i++) {
      var item = items[i];
      list.add(_gridViewItemUI(item));
    }
    return list;
  }

   Widget _gridViewItemUI(item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width: 50),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // HomeTopNavigator(navigatorList: navigatorList),
        return Scaffold(
          appBar: AppBar(title: Text('商城首页')),
          body: FutureBuilder(
            future: getHomePageContent(),
            builder: (ctx, snapshop) {
              if (snapshop.hasData) {
                var data = json.decode(snapshop.data.toString());
                List<Map>  swiper = (data['data']['slides'] as List).cast();
                List<Map>  navigatorList = (data['data']['category'] as List).cast();

                List<Widget> navigatorItems = _buildChildren(navigatorList);

                return Column(
                  children: <Widget>[
                    HomeSwiper(swiperDataList: swiper),
                    GridPage(children: navigatorItems, column: 5, row: 2),
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