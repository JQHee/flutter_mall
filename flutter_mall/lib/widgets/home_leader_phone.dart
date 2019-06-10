import 'package:flutter/material.dart';

/**
 *  首页店长电话模块
 */

class HomeLeaderPhone extends StatefulWidget {

  final String leaderImage;
  final String leaderPhone;

  const HomeLeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeLeaderPhoneState();
  }

}

class _HomeLeaderPhoneState extends State<HomeLeaderPhone> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: InkWell(
        onTap: () {},
        child: Image.network(widget.leaderImage),
      ),
    );
  }

}