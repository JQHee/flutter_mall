import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_mall/routers/application.dart';
import 'package:flutter_mall/routers/router_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/**
 * 首页轮播图
 */
class HomeSwiper extends StatefulWidget {

  final List swiperDataList;

  // 构造函数
  const HomeSwiper({Key key, this.swiperDataList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeSwiperState();
  }

}

class _HomeSwiperState extends State<HomeSwiper> {
  
  @override
  Widget build(BuildContext context) {

  /*
   var screenSize = MediaQuery.of(context).size;
   var bannerHeight = screenSize.width / 375.0 * 120;
   */
    // TODO: implement build
    // Image.network("${widget.swiperDataList[index]['image']}",fit: BoxFit.fill,);
     return Container(
      height: ScreenUtil().setHeight(240),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: () {
              RouterUtil.routeToDetailPage(context, widget.swiperDataList[index]['id']);
              // Application.router.navigateTo(context, '/detail?id=${widget.swiperDataList[index]['id']}');
            },
            child: TransitionToImage(
              image: AdvancedNetworkImage("${widget.swiperDataList[index]['image']}"),
              fit: BoxFit.fill,
              placeholder: Image.asset('lib/images/default_loading.png'),
            ),
          );
        },
        itemCount: widget.swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

}