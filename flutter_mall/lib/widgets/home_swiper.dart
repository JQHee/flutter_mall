import 'package:flutter/material.dart';
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

   var screenSize = MediaQuery.of(context).size;
   var bannerHeight = screenSize.width / 375.0 * 120;
    // TODO: implement build
     return Container(
      height: bannerHeight,
      width: screenSize.width,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${widget.swiperDataList[index]['image']}",fit: BoxFit.fill,);
        },
        itemCount: widget.swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

}