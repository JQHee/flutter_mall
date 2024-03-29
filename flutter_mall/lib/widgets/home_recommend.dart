import 'package:flutter/material.dart';
import 'package:flutter_mall/routers/application.dart';
import 'package:flutter_mall/routers/router_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 商品推荐（可左右滑动,横向滚动）
 */

class HomeRecommend extends StatefulWidget {

  final List recommendList;

  const HomeRecommend({Key key, this.recommendList}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeRecommendState();
  }

}

class _HomeRecommendState extends State<HomeRecommend> {


  // 商品推荐的头部
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5,color: Colors.black12)
        )
      ),
      child: Text('商品推荐', style: TextStyle(color: Colors.pink),),
    );
  }

  // 商品单项
  Widget _item(context, index) {
    return InkWell(
      onTap: () {
        RouterUtil.routeToDetailPage(context, widget.recommendList[index]['goodsId']);
        // Application.router.navigateTo(context, '/detail?id=${widget.recommendList[index]['goodsId']}');
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(widget.recommendList[index]['image']),
            Text('￥${widget.recommendList[index]['mallPrice']}'),
            Text(
              '￥${widget.recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              ),)
          ],
        ),
      ),
    );
  }

  // 横向列表
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.recommendList.length,
        itemBuilder: (context, index) {
          return _item(context, index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendList()
        ],

      ),
    );
  }

}