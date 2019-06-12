import 'package:flutter/material.dart';
import 'dart:convert';
// 自定义
// import 'package:flutter_mall/widgets/home_top_navigator.dart';
import 'package:flutter_mall/widgets/home_grid_page.dart';
import 'package:flutter_mall/widgets/home_ad_banner.dart';
import 'package:flutter_mall/widgets/home_leader_phone.dart';
import 'package:flutter_mall/widgets/home_recommend.dart';
import 'package:flutter_mall/widgets/home_floor_title.dart';
import 'package:flutter_mall/widgets/home_floor_content.dart';
import 'package:flutter_mall/widgets/home_hot_goods_title.dart';
// 网络请求
import 'package:flutter_mall/common/service/home_service.dart';
// 第三方
import 'package:flutter_mall/widgets/home_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

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

  // 热门商品数据
  int page = 1;
  List<Map> hotGoodsList=[];
  // 自定义刷新控件的
  // 插件要求必须自定义key
  // GlobalKey<EasyRefreshState> _easyRefreshKey =new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

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

    //火爆商品接口
  void _getHotGoods(){
     var formPage={'page': page};
     getHomeHotGoods(page).then((value) {
       var data=json.decode(value.toString());
       List<Map> newGoodsList = (data['data'] as List ).cast();
       setState(() {
         hotGoodsList.addAll(newGoodsList);
         page++; 
       });
     });
  }

  //火爆专区组合
  Widget _hotGoods(){
    return Container(     
      child:Column(
        children: <Widget>[
          HomeHotGoodsTitle(),
            _wrapList(),
        ],
      )   
    );
  }

    //火爆专区子项
  Widget _wrapList(){

    if(hotGoodsList.length != 0){
       List<Widget> listWidget = hotGoodsList.map((val){
          
          return InkWell(
            onTap:(){},
            child: 
            Container(
              width: ScreenUtil().setWidth(372),
              color:Colors.white,
              padding: EdgeInsets.all(5.0),
              margin:EdgeInsets.only(bottom:3.0),
              child: Column(
                children: <Widget>[
                  Image.network(val['image'],width: ScreenUtil().setWidth(375),),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow:TextOverflow.ellipsis ,
                    style: TextStyle(color:Colors.pink,fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val['mallPrice']}'),
                      Text(
                        '￥${val['price']}',
                        style: TextStyle(color:Colors.black26,decoration: TextDecoration.lineThrough),
                        
                      )
                    ],
                  )
                ],
              ), 
            )
           
          );

      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else{
      return Text(' ');
    }
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
                String adPicture = data['data']['advertesPicture']['PICTURE_ADDRESS'];
                // 店长模块
                String leaderImage = data['data']['shopInfo']['leaderImage'];
                String leaderPhone = data['data']['shopInfo']['leaderPhone'];

                // 推荐商品数据
                List<Map> recommendList = (data['data']['recommend'] as List).cast();

                // 楼层标题
                String floor1Title = data['data']['floor1Pic']['PICTURE_ADDRESS'];
                List<Map> floor1 = (data['data']['floor1'] as List).cast();
                String floor2Title = data['data']['floor2Pic']['PICTURE_ADDRESS'];
                List<Map> floor2 = (data['data']['floor2'] as List).cast();
                String floor3Title = data['data']['floor3Pic']['PICTURE_ADDRESS'];
                List<Map> floor3 = (data['data']['floor3'] as List).cast();

                List<Widget> navigatorItems = _buildChildren(navigatorList);

                return EasyRefresh(
                  refreshFooter: ClassicsFooter(
                    key: _footerKey,
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    moreInfoColor: Colors.white,
                    showMore: true,
                    noMoreText: '加载结束',
                    moreInfo: '加载中',
                    loadReadyText: '上拉加载...',
                  ),
                  child: ListView(
                    children: <Widget>[
                      HomeSwiper(swiperDataList: swiper),
                      HomeGridPage(children: navigatorItems, column: 5, row: 2, height: 190, padding: EdgeInsets.all(5),),
                      HomeAdBanner(adPicture: adPicture,),
                      HomeLeaderPhone(leaderImage: leaderImage,leaderPhone: leaderPhone,),
                      HomeRecommend(recommendList: recommendList,),
                      HomeFloorTitle(picture_address: floor1Title,),
                      HomeFloorContent(floorGoodsList: floor1,),
                      HomeFloorTitle(picture_address: floor2Title,),
                      HomeFloorContent(floorGoodsList: floor2,),
                      HomeFloorTitle(picture_address: floor3Title,),
                      HomeFloorContent(floorGoodsList: floor3,),
                      _hotGoods(),
                    ],
                  ),
                  loadMore: () async {
                    print('开始加载更多');
                    _getHotGoods();
                  },
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