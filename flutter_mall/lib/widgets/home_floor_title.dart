import 'package:flutter/material.dart';

/**
 * 首页楼层标题
 */

class HomeFloorTitle extends StatefulWidget {

  final String picture_address;

  const HomeFloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeFloorTitleState();
  }

}

class _HomeFloorTitleState extends State<HomeFloorTitle> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(widget.picture_address),
    );
  }

}