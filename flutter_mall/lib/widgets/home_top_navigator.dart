import 'package:flutter/material.dart';

/**
 * 首页中间部分的功能导航
 */
class HomeTopNavigator extends StatefulWidget {

  final List navigatorList;

  const HomeTopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeTopNavigatorState();
  }

}

class _HomeTopNavigatorState extends State<HomeTopNavigator> {


  Widget _gridViewItemUI(BuildContext context, item) {
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

    // 超过十个则移除
    if (widget.navigatorList.length > 10) {
      widget.navigatorList.removeRange(10, widget.navigatorList.length);
    }

    // TODO: implement build
    return Container(
      height: 165,
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5, // 每一行显示5个
        crossAxisSpacing: 5, //水平子Widget之间间距
        mainAxisSpacing: 5, //垂直子Widget之间间距
        padding: EdgeInsets.all(5.0),
        children: widget.navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }

}