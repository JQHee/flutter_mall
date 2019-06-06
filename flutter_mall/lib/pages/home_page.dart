import 'package:flutter/material.dart';
import 'package:flutter_mall/widgets/home_swiper.dart';

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
      body: Center(
        child: Text('商城首页'),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}