import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall/common/service/category_service.dart';
import 'package:flutter_mall/models/category_goods_list.dart';
import 'package:flutter_mall/provide/category_child_provide.dart';
import 'package:flutter_mall/provide/category_goods_list_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_mall/routers/application.dart';

/**
 * 类别的商品列表
 * 可上拉加载
 */

class CategroyGoodsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategroyGoodsListState();
  }

}

class _CategroyGoodsListState extends State<CategroyGoodsList> {

  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  // 用于加载第一页，让商品列表会顶部
  var scrollController = new ScrollController();


  // 获取商品列表
   _getMoreList() async {
    Provide.value<CategoryChildProvide>(context).addPage();
    String  categoryId = Provide.value<CategoryChildProvide>(context).categoryId;
    String categorySubId = Provide.value<CategoryChildProvide>(context).subId;
    int page = Provide.value<CategoryChildProvide>(context).page;
    CategoryGoodsList goodsList = await getGoodsList(page, categoryId, categorySubId);
    // 更改右侧商品列表的值
    if (goodsList.data == null) {
      Fluttertoast.showToast(
        msg:'已经到底了',
        toastLength: Toast.LENGTH_SHORT,//适应短的提示
        gravity: ToastGravity.CENTER,//中间提示
        backgroundColor: Colors.pink,
        textColor: Colors.white,
        fontSize: 16.0
      );
      Provide.value<CategoryChildProvide>(context).changNoMore('没有更多了');
    } else {
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data ?? []);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _goodsImage(List newList, index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList, index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List newList, index) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text(
            '价格￥${newList[index].presentPrice}',
            style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30))
          ),
          Text(
            '价格￥${newList[index].oriPrice}',
            overflow: TextOverflow.clip,
            style: TextStyle(color: Colors.black26, fontSize: ScreenUtil().setSp(26), decoration: TextDecoration.lineThrough), // 删除线
          )
        ],
      ),
    );
  }

  Widget _listWidget(List newList, index) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${newList[index].goodsId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index),
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, goodsList) {

        // 返回顶部
        try {
          if ( Provide.value<CategoryChildProvide>(context).page == 1) {
            scrollController.jumpTo(0.0);
          }
        } catch (e) {
          print('进入页面第一次初始化:${e}');
        }
      
        if (goodsList.goodsList.length > 0) {
          return Expanded( // Expaned是有伸缩能力的小部件
            child: Container(
                width: ScreenUtil().setWidth(570),
                child: EasyRefresh(
                    refreshFooter: ClassicsFooter(
                    key: _footerKey,
                    bgColor: Colors.white,
                    textColor: Colors.pink,
                    moreInfoColor: Colors.white,
                    showMore: true,
                    noMoreText: Provide.value<CategoryChildProvide>(context).noMoreText,
                    moreInfo: '加载中',
                    loadReadyText: '上拉加载...',
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: goodsList.goodsList.length,
                    itemBuilder: (context, index) {
                      return _listWidget(goodsList.goodsList, index);
                    },
                  ),
                  loadMore:() async {
                    print('上拉加载更多');
                    _getMoreList();
                  },
                )
              )
          );
        } else {
          return Text('暂无数据');
        }

      },
    ) ;
  }

}